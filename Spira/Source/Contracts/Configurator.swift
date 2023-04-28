//
//  Configuration.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import UIKit

/// Base class to perform base behaviour for the app scene configurators.
protocol SpiraConfigurator {
    func rawViewController<V: UIViewController>() -> V?
    func preparedViewController<V: UIViewController>() -> V?
    func prepareScene(viewController: UIViewController)
    func setup(inputParams: Any?, delegate: Any?, forViewController viewController: UIViewController)
    func xibName() -> String
    func isValid(viewController: UIViewController) -> Bool
//    func viewType<T>() -> T.Type
}

// MARK: - Protocol extension to provide a default implementation for some methods.
extension SpiraConfigurator {
    
    func rawViewController<V: UIViewController>() -> V? {
        let viewController = V(nibName: xibName(), bundle: nil)
        if !isValid(viewController: viewController) {
            assertionFailure("Invalid UIViewController to prepare scene")
            return nil
        }
        return viewController
    }
    
    func preparedViewController<V: UIViewController>() -> V? {
        guard let viewController: V = rawViewController() else { return nil }
        prepareScene(viewController: viewController)
        return viewController
    }
    
    func setup(inputParams: Any?, delegate: Any?, forViewController viewController: UIViewController) {}
}
