//
//  ProductosModel.swift
//  Spira
//
//  Created by Alejandro Agudelo on 27/04/23.
//

import Foundation

struct ProductosRequest: Request {

    typealias Response = [ProductoDTO]
    typealias Body = [String : String]
    
    let endpoint = "products"
    let method: RequestMethod = .get
    var params: [String] = []
    let body: Body? = nil
}

struct ProductoDTO: Decodable {
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable {
    let rate: Float
    let count: Int
}

struct Producto {
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
}

struct ProductosViewModel {
    
}
