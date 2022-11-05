//
//  ProductCell.swift
//  Vender
//
//  Created by Emincan on 5.11.2022.
//

import UIKit
import SnapKit

class ProductCell: UITableViewCell {
    
    static let identifier = "cell"
    
     let nameLabel: UILabel = {
        let nameLabel = UILabel()
        return nameLabel
    }()
     let priceLabel: UILabel = {
        let priceLabel = UILabel()
         priceLabel.adjustsFontSizeToFitWidth = true
        return priceLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        makeMynameLabel()
        makeMyPriceLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
    }
    

}
//MARK: const
extension ProductCell {
    private func makeMynameLabel() {
        nameLabel.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.width.equalTo(70)
        }
    }
    private func makeMyPriceLabel() {
        priceLabel.snp.makeConstraints { make in
            make.right.equalTo(-20)
            make.top.equalTo(nameLabel.snp.top)
            make.width.equalTo(30)
        }
    }
}
