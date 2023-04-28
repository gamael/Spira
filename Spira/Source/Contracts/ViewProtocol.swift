//
//  Configuration.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import UIKit

protocol SpiraView: AnyObject {
    func setupUI()
    func presentError(_ error: String, title: String?)
}

extension SpiraView where Self: UIViewController {
    func presentError(_ error: String, title: String?) {
        show(error: error, title: title)
    }
}
