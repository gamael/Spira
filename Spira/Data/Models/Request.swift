//
//  Request.swift
//  Weather
//
//  Created by Alejandro Agudelo on 1/02/23.
//

import Foundation

enum RequestMethod: String {
    case post = "POST"
    case get = "GET"
}

protocol Request {
    associatedtype Response: Decodable
    associatedtype Body: Codable
    
    var endpoint: String { get }
    var method: RequestMethod { get }
    var params: [String] { get }
    var body: Body? { get }
    var bodyEncoder: JSONEncoder { get }
    var responseDecoder: JSONDecoder { get }
}

extension Request {
    var path: String {
        get {
            return String(format: self.endpoint, arguments: params)
        }
    }
    
    var bodyEncoder: JSONEncoder {
        get {
            return JSONEncoder()
        }
    }
    
    var responseDecoder: JSONDecoder {
        get {
            return JSONDecoder()
        }
    }
}
