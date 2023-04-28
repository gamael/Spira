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


extension Producto {
    func toCellViewModel() -> ProductosCellViewModel {
        let pc: ProductosCellViewModelImpl = .init(
            productName: self.title,
            productPrice: "\(self.price)",
            productImage: self.image
        )
        return pc
    }
}
