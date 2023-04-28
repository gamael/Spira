//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Alejandro Agudelo on 16/02/23.
//

import UIKit

protocol ProductosCellViewModel {
    var productName: String { get }
    var productPrice: String { get }
    var productImage: String { get }
}

class ProductosCell: UITableViewCell {
    
    struct Constants {
        static let reuseIdentifier = "productosCellIdentifier"
        static let nibName = "ProductosCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .checkmark
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    func setupCell(_ viewModel: ProductosCellViewModel) {
        textLabel?.text = viewModel.productName
        detailTextLabel?.text = viewModel.productPrice
    }
}
