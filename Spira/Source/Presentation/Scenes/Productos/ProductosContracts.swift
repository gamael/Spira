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
}

protocol ProductosView: SpiraView {
}

protocol ProductosWireframe: SpiraWireframe {
    
}
