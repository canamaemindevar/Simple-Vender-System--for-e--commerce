//
//  MainTabbar.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import UIKit

class TabbarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


            let vc1 = UINavigationController(rootViewController: NewProductViewController())
            let vc2 = UINavigationController(rootViewController: MyProductsViewController())
            
            vc1.tabBarItem.image = UIImage(systemName: "homekit")
            vc2.tabBarItem.image = UIImage(systemName: "play.circle")
            
            vc1.title = "Home"
            vc2.title = "Coming Soon"
            
            tabBar.tintColor = .label // ??????
            
            setViewControllers([vc1,vc2], animated: true)
            }
    

 

}

/*
 final class MyProductsViewController: UIViewController {
     
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
     func onSelected(item: PostModel) {
         print(item.body )
     }
     
     
 }


 */
