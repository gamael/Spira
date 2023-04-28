//
//  ProductosMapper.swift
//  Spira
//
//  Created by Alejandro Agudelo on 28/04/23.
//

import Foundation

extension ProductoDTO {
    func toEntity() -> Producto {
        return .init(
            title: self.title,
            price: self.price,
            description: self.description,
            category: self.category,
            image: self.image)
    }
}
