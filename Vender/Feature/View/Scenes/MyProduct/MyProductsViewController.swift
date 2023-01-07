//
//  MyProductsViewController.swift
//  Vender
//
//  Created by Emincan on 27.10.2022.
//

import UIKit
import SnapKit


protocol MyProductsViewInterface: AnyObject {
    func prepareForTableView()
}

final class MyProductsViewController: UIViewController {

   
    private lazy var tableViewVM: TableViewVM = TableViewVM()
    private lazy var viewModel = MyProductsViewModel()
    private var service: ProductManagerService = ProductManagerService()
    
    private let tableViewOutlet: UITableView = {
        let tableViewOutlet = UITableView()
        tableViewOutlet.layer.cornerRadius = 5
        return tableViewOutlet
    }()
    
    private let myView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .orange
        myView.layer.cornerRadius = 200
        return myView
    }()
    
    private let profileView: UIImageView = {
        let profileView = UIImageView()
        profileView.image = UIImage(systemName: "person.crop.circle")
        return profileView
    }()
    private let profileLabel: UILabel = {
        let profileLabel = UILabel()
        profileLabel.text = " User Name Surname "
        profileLabel.adjustsFontSizeToFitWidth = true
        return profileLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
        // view modele taşı
   
    }
    override class func awakeFromNib() {
        //
    }
 
    private func setUp(){
        tableViewOutlet.delegate = tableViewVM
        tableViewOutlet.dataSource = tableViewVM
        tableViewVM.delegate = self
        tableViewOutlet.register(ProductCell.self, forCellReuseIdentifier: ProductCell.identifier)
        title = "My Products"
       
        
    }
    private func addSubViews(){
        view.addSubview(myView)
        view.addSubview(tableViewOutlet)
        myView.addSubview(profileView)
        myView.addSubview(profileLabel)
    }
    
    private func makeContraits(){
        makeMyView()
        makeMytableView()
        makeMyProfileView()
        makeMyProfileLabel()
    }
    
    private func initService() {
        service.fethAllPosts { [weak self] (models) in
            self?.tableViewVM.updateTable(items: models)
            self?.tableViewOutlet.reloadData()
        } onFail: { (data) in
            print(data ?? "")
        }
    }


}

extension MyProductsViewController:tableViewOutput{
    func onSelected(item: ModelElementArray) {
      //  print(item.body )
    }
    
}
 
//MARK: contsraits

extension MyProductsViewController {
    func makeMyView() {
        myView.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(view).multipliedBy(0.4)
        }
    }
    private func makeMytableView() {
        tableViewOutlet.snp.makeConstraints { make in
            make.top.equalTo(myView.snp.bottom).offset(10)
            make.left.equalTo(0)
            make.right.equalTo(0)
            make.bottom.equalTo(0)
            make.height.equalTo(view).multipliedBy(0.6)
        }
    }
    private func makeMyProfileView() {
        profileView.snp.makeConstraints { make in
            make.top.equalTo(100)
            make.left.equalTo(100)
            make.height.equalTo(myView).multipliedBy(0.5)
            
            
        }
    }
    private func makeMyProfileLabel() {
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileView.snp.bottom).offset(20)
            make.height.equalTo(70)
            make.left.equalTo(profileView.snp.left)
            make.right.equalTo(profileView.snp.right)
        }
    }
}


extension MyProductsViewController: MyProductsViewInterface {
    func prepareForTableView() {
        addSubViews()
        makeContraits()
        setUp()
        initService()
        view.backgroundColor = .orange 
    }
    
    
}
