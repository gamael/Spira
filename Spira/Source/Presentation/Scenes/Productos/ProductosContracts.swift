//
//  ProductosContracts.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

protocol ProductosInteractor: SpiraInteractor {
    func didTapProduct(index: Int)
}

protocol ProductosPresenter: SpiraPresenter {
    func prepareView()
    func showError(_ error: ApiError)
    func showData(_ productos: [Producto])
}

protocol ProductosView: SpiraView {
}

protocol ProductosWireframe: SpiraWireframe {
    
}
