//
//  NetworkManager.swift
//  Weather
//
//  Created by Alejandro Agudelo on 1/02/23.
//

import Foundation

protocol ServiceLocatorModule {
    func registerServices(container: ServiceLocator)
}

protocol Locator {
    func resolve<T>() -> T
}

class ServiceLocator: Locator {
    static let shared = ServiceLocator()
        
    private var services: [ObjectIdentifier: Any] = [:]
    
    private init() {}
    
    func register<T>(_ service: () -> T) {
        services[key(for: T.self)] = service()
    }
    
    func resolve<T>() -> T {
        if let service = services[key(for: T.self)] {
            return service as! T
        } else {
            fatalError("Could not find registered definition for \(T.self)")
        }
    }

    private func key<T>(for type: T.Type) -> ObjectIdentifier {
        return ObjectIdentifier(T.self)
    }
    
    func registerModules(modules: [ServiceLocatorModule]) {
        modules.forEach { $0.registerServices(container: self) }
    }
}
