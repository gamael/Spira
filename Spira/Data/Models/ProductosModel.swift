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
    
    struct ProductosCellViewModelImpl: ProductosCellViewModel {
        var productName: String
        var productPrice: String
        var productImage: String
    }
    
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
}

struct ProductosViewModel {
    let numberOfSections: Int
    let numberOfRows: Int
    let defaultHeight: CGFloat
    let productosCellViewModel: [ProductosCellViewModel]
    
    init() {
        self.numberOfSections = 0
        self.numberOfRows = 0
        self.defaultHeight = 150
        self.productosCellViewModel = [ProductosCellViewModel]()
    }
    
    init(numberOfSections: Int, numberOfRows: Int, productosCellViewModel: [ProductosCellViewModel]) {
        self.defaultHeight = 150
        self.numberOfSections = numberOfSections
        self.numberOfRows = numberOfRows
        self.productosCellViewModel = productosCellViewModel
    }
}
