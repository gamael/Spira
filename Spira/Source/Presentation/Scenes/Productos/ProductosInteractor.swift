//
//  LocationsInteractor.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

import Foundation

class ProductosInteractorImpl: ProductosInteractor {
    
    struct Dependencies {
        let defaultRepository: NetworkManager
    }
    
    let presenter: ProductosPresenter
    let dependencies: Dependencies
    
    
    init(presenter: ProductosPresenter, depedencies: Dependencies) {
        self.presenter = presenter
        self.dependencies = depedencies
    }
    
    func viewDidUpdate(status: ViewStatus) {
        switch status {
        case .didLoad:
            presenter.prepareView()
        default:
            break
        }
    }
    
    func didTapProduct(index: Int) {
        
    }
}
