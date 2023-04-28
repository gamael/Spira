//
//  ProductosTVC.swift
//  Weather
//
//  Created by Alejandro Agudelo on 28/03/23.
//

import UIKit

class ProductosTVC: UITableViewController {
    
    typealias cellType = ProductosCell
    
    var interactor: ProductosInteractor!
    var viewModel = ProductosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.viewDidUpdate(status: .didLoad)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.Constants.reuseIdentifier, for: indexPath) as! cellType
        cell.setupCell(viewModel.productosCellViewModel[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.didTapProduct(index: indexPath.row)
    }
}

extension ProductosTVC: ProductosView {
    func setupUI() {
        title = "Productos"
        tableView.register(UINib(nibName: cellType.Constants.nibName, bundle: nil), forCellReuseIdentifier: cellType.Constants.reuseIdentifier)
    }
    
    func displayProductos(_ productosViewModel: ProductosViewModel) {
        viewModel = productosViewModel
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
