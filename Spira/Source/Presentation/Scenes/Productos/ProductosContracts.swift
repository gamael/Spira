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
    func showDetalle(_ producto: Producto)
}

protocol ProductosView: SpiraView {
    func displayProductos(_ productosViewModel: ProductosViewModel )
}

protocol ProductosWireframe: SpiraWireframe {
    func navigateToDetalle(producto: Producto)
}
