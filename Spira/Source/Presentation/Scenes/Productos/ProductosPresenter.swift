//
//  LocationsPresenter.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

import Foundation

class ProductosPresenterImpl: ProductosPresenter {
    
    weak var view: ProductosView!
    weak var wireframe: ProductosWireframe!
    
    init(view: ProductosView, wireframe: ProductosWireframe) {
        self.view = view
        self.wireframe = wireframe
    }
    
    func showLoader() {
        wireframe.showLoading()
    }
    
    func hideLoader() {
        wireframe.dismissLoading()
    }
    
    func dismissScene() {
        wireframe.dismissCurrentScene()
    }
    
    func prepareView() {
        view.setupUI()
    }
    
    func showError(_ error: ApiError) {
        switch error {
        case .invalid(let errorMessage):
            let titleMessage = "Server response invalid"
            view.presentError(errorMessage, title: titleMessage)
        case .transportError(let errorMessage):
            let titleMessage = "There was an error with the request"
            view.presentError(errorMessage, title: titleMessage)
        case .serverSideError(let errorMessage):
            let titleMessage = "There was an error in the server"
            view.presentError(errorMessage, title: titleMessage)
        }
    }
    
    func showData(_ productos: [Producto]) {
        let pcvm = productos.map { producto in
            producto.toCellViewModel()
        }
        //numberOfSections por defecto a uno ya que no se usan secciones en este ejemplo
        let pVM: ProductosViewModel = .init(
            numberOfSections: 1,
            numberOfRows: productos.count,
            productosCellViewModel: pcvm
        )
        view.displayProductos(pVM)
    }
    
    func showDetalle(_ producto: Producto) {
        wireframe.navigateToDetalle(producto: producto)
    }
}
