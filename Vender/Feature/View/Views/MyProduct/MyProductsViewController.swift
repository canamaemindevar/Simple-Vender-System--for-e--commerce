//
//  MyProductsViewController.swift
//  Vender
//
//  Created by Emincan on 27.10.2022.
//

import UIKit

class MyProductsViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    private var tableViewVM: TableViewVM = TableViewVM()
    private var service: ProductManagerService = ProductManagerService()
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        initService()
        view.backgroundColor = .yellow
    }
    override class func awakeFromNib() {
        //
    }
 
    private func setUp(){
        tableViewOutlet.delegate = tableViewVM
        tableViewOutlet.dataSource = tableViewVM
        tableViewVM.delegate = self
        title = "My Products"
        myView.backgroundColor = .black
        myView.layer.cornerRadius = 100
        
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
 


