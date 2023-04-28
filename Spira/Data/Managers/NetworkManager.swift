//
//  NetworkManager.swift
//  Weather
//
//  Created by Alejandro Agudelo on 1/02/23.
//

import Foundation

enum ApiError: Error {
    case invalid(String)
    case transportError(String)
    case serverSideError(String)
}

protocol NetworkManager {
    typealias TaskResult<T : Decodable> = Result<T, ApiError>
    func execute<R : Request>(request: R) async -> TaskResult<R.Response>
}

class NetworkManagerImpl: NetworkManager {
    
    private let urlSession = URLSession.shared
    private let baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func execute<R>(request: R) async -> TaskResult<R.Response> where R : Request {
        guard let urlRequest = createURLRequest(request) else {
            return .failure(.invalid("The request is not valid"))
        }
        do {
            let decodedObject: R.Response = try await executeRequest(urlRequest, request.responseDecoder)
            return .success(decodedObject)
        } catch {
            guard let apiError = error as? ApiError else {
                return .failure(.serverSideError("invalid response"))
                
            }
            return .failure(apiError)
        }
    }
    
    private func createURLRequest<R : Request>(_ request: R) -> URLRequest? {
        guard let url = URL(string: baseURL + request.path) else {
            return nil
        }
        let urlRequest = URLRequest(url: url)
        return urlRequest
    }
    
    private func executeRequest<T: Decodable>(
        _ request: URLRequest,
        _ responseDecoder: JSONDecoder
    ) async throws -> T {
        
        let (data, response) = try await urlSession.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200 else {
            throw ApiError.serverSideError("Invalid response")
        }
        
        guard let decodedObject: T = decodeFrom(data, with: responseDecoder) else {
            throw ApiError.invalid("There was a problem while parsing the data")
        }
        
        return decodedObject
    }
    
    private func decodeFrom<O: Decodable>(_ data: Data, with decoder: JSONDecoder) -> O? {
        do {
            let decodedObject = try decoder.decode(O.self, from: data)
            return decodedObject
        } catch (let error) {
            print(error)
            return nil
        }
    }
}
