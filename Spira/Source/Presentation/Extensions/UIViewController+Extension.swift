//
//  UIViewController+Extension.swift
//  Weather
//
//  Created by Alejandro Agudelo on 10/03/23.
//

import UIKit

extension UIViewController {
    
    func show(error: String, title: String?) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        alert.addAction(.init(title: "Dismiss", style: .cancel))
        DispatchQueue.main.async {
            self.present(alert, animated: true)
        }
    }
    
    func showActivityIndicator() {
        for subView in self.view.subviews {
            if subView is UIActivityIndicatorView {
                return
            }
        }
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            for subView in self.view.subviews {
                if let indicator = subView as? UIActivityIndicatorView {
                    indicator.stopAnimating()
                }
            }
        }
    }
}
