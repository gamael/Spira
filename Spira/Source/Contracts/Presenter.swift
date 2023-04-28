//
//  Configuration.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import Foundation

/// Base module interface where we will know the state of the view so we will do the stuff needed.
protocol SpiraPresenter: AnyObject {
    func showLoader()
    func hideLoader()
    func dismissScene()
}
