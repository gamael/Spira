//
//  LocationsConfigurator.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

import UIKit

class ProductosConfigurator: SpiraConfigurator {
    typealias presenterImpl = ProductosPresenterImpl
    typealias interactorImpl = ProductosInteractorImpl
    typealias viewImpl = ProductosTVC
    
    static let shared = ProductosConfigurator()
    fileprivate struct Constants {
        static let xibName: String = "ProductosTVC"
    }
    
    private init () {}
    
    func prepareScene(viewController: UIViewController) {
        guard let view = viewController as? viewImpl else {
            assertionFailure("Invalid UIViewController to prepare scene")
            return
        }
        let presenter = presenterImpl(view: view, wireframe: view)
        let dependencies = ProductosInteractorImpl.Dependencies(defaultRepository: ServiceLocator.shared.resolve())
        let interactor = interactorImpl(presenter: presenter, depedencies: dependencies)
        view.interactor = interactor
    }
    
    func xibName() -> String {
        return Constants.xibName
    }
    
    func isValid(viewController: UIViewController) -> Bool {
        return viewController is viewImpl
    }
    
    func viewType() -> viewImpl.Type {
        return viewImpl.self
    }
}
