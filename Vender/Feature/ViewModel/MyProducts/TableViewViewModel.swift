//
//  TableViewViewModel.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import Foundation
import UIKit

protocol tableViewProtocol{
    func updateTable(items: ModelElementArray)
}
protocol tableViewOutput: AnyObject{
    func onSelected(item:PostModel)
}

final class TableViewVM: NSObject{
    
   
    private lazy var items: [ModelElement] = []
    
   weak var delegate: tableViewOutput?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
        
        cell.textLabel?.text =  "\(items[indexPath.row].name!):   \(items[indexPath.row].price!)"
     //  cell.detailTextLabel?.text =  items[indexPath.row].name
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //   delegate?.onSelected(item: items[indexPath.row])
    }
}


extension TableViewVM:UITableViewDelegate,UITableViewDataSource{}

extension TableViewVM: tableViewProtocol{
    func updateTable(items: ModelElementArray) {
        items.forEach { _,result in
            self.items.append(.init(name: result.name, price: result.price))
        }
       
        
    
}


}
