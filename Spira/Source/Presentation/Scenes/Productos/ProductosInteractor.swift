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
            fetchData()
        default:
            break
        }
    }
    
    func didTapProduct(index: Int) {
        
    }
}

extension ProductosInteractorImpl {
    fileprivate func fetchData() {
        presenter.showLoader()
        let productosRequest = ProductosRequest()
        Task {
            presenter.hideLoader()
            let requestResult = await dependencies.defaultRepository.execute(request: productosRequest)
            switch requestResult {
            case .success(let response):
                let productos = response.map { productoDTO in
                    productoDTO.toEntity()
                }
                presenter.showData(productos)
            case .failure(let error):
                presenter.showError(error)
            }
        }
    }
}
