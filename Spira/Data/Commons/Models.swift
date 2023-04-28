//
//  Models.swift
//  Weather
//
//  Created by Alejandro Agudelo on 13/02/23.
//

import Foundation

enum ViewStatus: Int {
    case didLoad, willAppear, didAppear, willDisappear, didDisappear
    
    init() {
        self = .didLoad
    }
}
