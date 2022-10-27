//
//  TableViewViewModel.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import Foundation
import UIKit

protocol tableViewProtocol{
    func updateTable(items: [PostModel])
}
protocol tableViewOutput: class{
    func onSelected(item:PostModel)
}

final class TableViewVM: NSObject{
    
   
    private lazy var items: [PostModel] = []
    
   weak var delegate: tableViewOutput?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = UITableViewCell()
        
        cell.textLabel?.text =  items[indexPath.row].title
        cell.detailTextLabel?.text =  items[indexPath.row].body
                return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
}


extension TableViewVM:UITableViewDelegate,UITableViewDataSource{}

extension TableViewVM: tableViewProtocol{
    func updateTable(items: [PostModel]) {
        self.items = items
    }
    
    
}


