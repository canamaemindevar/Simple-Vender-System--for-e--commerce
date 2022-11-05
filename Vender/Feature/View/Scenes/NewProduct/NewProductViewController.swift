//
//  NewProductViewController.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import UIKit
import SnapKit

final class NewProductViewController: UIViewController {
    
//MARK: Components
    private let nameTextField: UITextField = {
        let nameTextField = UITextField()
        nameTextField.placeholder = "New Product Name"
        nameTextField.backgroundColor = .orange
        nameTextField.layer.cornerRadius = 20
        return nameTextField
    }()
    
    private let priceTextFiled: UITextField = {
        let priceTextFiled = UITextField()
        priceTextFiled.placeholder = "New Product Price"
        priceTextFiled.backgroundColor = .orange
        priceTextFiled.layer.cornerRadius = 20
        return priceTextFiled
    }()
    
    private let saveButton: UIButton = {
        let saveButton = UIButton()
        saveButton.setTitle("Done", for: .normal)
        saveButton.backgroundColor = .darkGray
        saveButton.layer.cornerRadius = 20
        return saveButton
    }()
    
   
    
//MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "New Product"
        view.backgroundColor = .white
        addSubviews()
        makeConstraits()
        
    }
    
//MARK: funcs
    
   private func addSubviews() {
        view.addSubview(nameTextField)
        view.addSubview(priceTextFiled)
        view.addSubview(saveButton)
    }
    
    private func makeConstraits(){
        makeMyNameField()
        makeMyPriceField()
        makeMyButton()
        saveButton.addTarget(self, action: #selector(btnclicked), for: .touchUpInside)
    }
    
    @objc private func btnclicked(){
        
        let name = nameTextField.text
        let price = Int(priceTextFiled.text ?? "0")
        let newProduct = ModelElement(name: name, price: price)
        NewProductManagerService.shared.sendingNewProduct(product: newProduct)
       
    }

 

}

//MARK: constraits

extension NewProductViewController {
    
   private func makeMyNameField(){
       nameTextField.snp.makeConstraints { make in
           make.top.equalTo(100)
           make.left.equalTo(50)
           make.right.equalTo(-50)
           make.height.equalTo(50)
       }
    }
    
    private func makeMyPriceField(){
        priceTextFiled.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(20)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
        }
        
    }
    
    private func makeMyButton(){
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(priceTextFiled.snp.bottom).offset(20)
            make.left.equalTo(50)
            make.right.equalTo(-50)
            make.height.equalTo(50)
            
        }
        
    }
}

