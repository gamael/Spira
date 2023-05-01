//
//  DetalleConfigurator.swift
//  Spira
//
//  Created by Alejandro Agudelo on 30/04/23.
//

import Foundation


class DetalleConfigurator {
    
    static let shared = DetalleConfigurator()
    typealias controller = DetalleProductoVC
    
    fileprivate struct Constants {
        static let xibName: String = "DetalleProductoVC"
    }
    
    private init () {}
    
    func getScene(with producto: Producto) -> controller {
        let viewController = controller(nibName: xibName(), bundle: nil)
        viewController.producto = producto
        return viewController
    }
    
    func xibName() -> String {
        return Constants.xibName
    }
}
