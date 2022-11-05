//
//  TableViewViewModel.swift
//  Vender
//
//  Created by Emincan on 26.10.2022.
//

import Foundation
import UIKit

protocol tableViewProtocol {
    func updateTable(items: ModelElementArray)
}
protocol tableViewOutput: AnyObject {
    func onSelected(item:ModelElementArray)
}

final class TableViewVM: NSObject{
    
    
    private lazy var items: [ModelElement] = []
    
    weak var delegate: tableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductCell.identifier, for: indexPath) as! ProductCell
        cell.nameLabel.text = items[indexPath.row].name
        cell.priceLabel.text = "\(items[indexPath.row].price!)$"
        cell.backgroundColor = .white
       // cell.textLabel?.text =  "\(items[indexPath.row].name!):   \(items[indexPath.row].price!)$ "
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
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
