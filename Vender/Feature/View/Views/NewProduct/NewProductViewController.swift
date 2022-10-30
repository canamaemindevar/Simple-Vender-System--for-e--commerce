//
//  NewProductViewController.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import UIKit

final class NewProductViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .yellow
        let name = "armut"
        let price = 5
        let newProduct = ModelElement(name: name, price: price)
        NewProductManagerService.shared.sendingNewProduct(product: newProduct)
    }
    

 

}
