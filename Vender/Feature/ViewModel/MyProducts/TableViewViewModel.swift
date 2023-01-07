//
//  MyProductsViewModel.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import Foundation
import UIKit



protocol MyProductsViewModelInterface {
     var view: MyProductsViewInterface? { get set }
    
    func viewDidLoad()
    
}

final class MyProductsViewModel {
    weak var view: MyProductsViewInterface?
}

extension MyProductsViewModel: MyProductsViewModelInterface {
    func viewDidLoad() {
        view?.prepareForTableView()
    }
    
    
}







