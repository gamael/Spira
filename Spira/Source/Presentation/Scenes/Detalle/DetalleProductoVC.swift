//
//  DetalleProductoVC.swift
//  Spira
//
//  Created by Alejandro Agudelo on 30/04/23.
//

import UIKit

class DetalleProductoVC: UIViewController {
    
    @IBOutlet weak var detalleImageView: UIImageView!
    @IBOutlet weak var detalleTitlelabel: UILabel!
    @IBOutlet weak var detalleDescriptionLabel: UILabel!
    
    var producto: Producto?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        guard let producto else {
            return
        }
        detalleTitlelabel.text = producto.title
        detalleDescriptionLabel.text = producto.description
        if let url = URL(string: producto.image) {
            detalleImageView.af.setImage(withURL: url)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
