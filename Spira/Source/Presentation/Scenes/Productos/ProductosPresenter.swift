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
}
