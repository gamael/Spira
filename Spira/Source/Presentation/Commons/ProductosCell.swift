//
//  CustomTableViewCell.swift
//  Weather
//
//  Created by Alejandro Agudelo on 16/02/23.
//

import UIKit
import AlamofireImage

protocol ProductosCellViewModel {
    var productName: String { get }
    var productPrice: String { get }
    var productImage: String { get }
}

class ProductosCell: UITableViewCell {
    
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var cellLabel1: UILabel!
    @IBOutlet weak var cellLabel2: UILabel!
    
    
    struct Constants {
        static let reuseIdentifier = "productosCellIdentifier"
        static let nibName = "ProductosCell"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(_ viewModel: ProductosCellViewModel) {
        cellLabel1.text = viewModel.productName
        cellLabel2.text = "$ " + viewModel.productPrice
        if let url = URL(string: viewModel.productImage) {
            cellImageView.af.setImage(withURL: url)
        }
    }
}
