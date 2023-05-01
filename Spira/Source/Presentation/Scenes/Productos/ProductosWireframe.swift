//
//  ProductosWireframe.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

import Foundation

extension ProductosTVC: ProductosWireframe {
    func navigateToDetalle(producto: Producto) {
        let vc = DetalleConfigurator.shared.getScene(with: producto)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func dismissCurrentScene() {}
}
