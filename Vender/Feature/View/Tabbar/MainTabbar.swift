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
            
            vc1.tabBarItem.image = UIImage(systemName: "plus")
            vc2.tabBarItem.image = UIImage(systemName: "folder")
            
            vc1.title = "New Product"
            vc2.title = "My Products"
            
            tabBar.tintColor = .label // ??????
            
            setViewControllers([vc1,vc2], animated: true)
            }
    
}
