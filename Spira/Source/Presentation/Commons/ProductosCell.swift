//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Alejandro Agudelo on 16/02/23.
//

import UIKit

protocol StandardTableViewCellViewModel {
    var cellText: String { get }
    var isSelected: Bool { get }
}

class ProductosCell: UITableViewCell {
    
    struct Constants {
        static let reuseIdentifier = "productosCellIdentifier"
        static let nibName = "ProductosTableViewCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        accessoryType = .checkmark
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? .checkmark : .none
    }
    
    func setupCell(_ viewModel: StandardTableViewCellViewModel) {
        textLabel?.text = viewModel.cellText
    }
}
