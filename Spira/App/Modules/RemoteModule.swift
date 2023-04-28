//
//  NetworkManager.swift
//  Weather
//
//  Created by Alejandro Agudelo on 10/02/23.
//

import Foundation

class RemoteModule: ServiceLocatorModule {
    func registerServices(container: ServiceLocator) {
        let networkManager = NetworkManagerImpl(baseURL: Configuration.API.apiURL)
        container.register({ networkManager as NetworkManager })
    }
}
