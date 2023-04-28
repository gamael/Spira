//
//  Configuration.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import UIKit

/// Base interface to report view common UI messages for user feedback.
protocol SpiraWireframe: FeedbackViewProtocol {
    func noInternetError()
    func dismissCurrentScene()
}

// MARK: - Extension with empty default implementation (to allow the protocol be optional).
extension SpiraWireframe {
    func noInternetError() {
        //TODO: Implementar
    }
}
