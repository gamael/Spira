//
//  Configuration.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import UIKit

/// Base interface to report view common UI messages for user feedback.
protocol FeedbackViewProtocol: AnyObject {
    func showLoading()
    func dismissLoading()
    func showError(message: String?)
    func showSuccess(message: String?)
}

// MARK: - Extension with empty default implementation (to allow the protocol be optional).
extension FeedbackViewProtocol {
    func showError(message: String?) {}
    func showSuccess(message: String?) {}
}

extension FeedbackViewProtocol where Self: UIViewController {
    func showLoading() {
        showActivityIndicator()
    }

    func dismissLoading() {
        hideActivityIndicator()
    }
}
