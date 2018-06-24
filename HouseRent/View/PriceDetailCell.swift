//
//  PriceDetailCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class PriceDetailCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont.setSemiBoldItaticFont(of: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "in Arasur Avantika, Pallikaranai, Chennai South, Chennai"
        label.textColor = UIColor(red: 0.27, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont.setFont(of: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.font = UIFont.setFont(of: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        [titleLabel, descriptionLabel, priceDetailsLabel].forEach {addSubview($0)}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        titleLabel.topAnchor.align(to: topAnchor, offset: 10)
        titleLabel.leftAnchor.align(to: leftAnchor, offset: 20)
        titleLabel.rightAnchor.align(to: rightAnchor, offset: -10)
        titleLabel.heightAnchor.equal(to: 16)
        
        descriptionLabel.topAnchor.align(to: titleLabel.bottomAnchor, offset: 6)
        descriptionLabel.leftAnchor.align(to: leftAnchor, offset: 20)
        descriptionLabel.rightAnchor.align(to: rightAnchor, offset: -10)
        descriptionLabel.heightAnchor.equal(to: 14)
        
        priceDetailsLabel.topAnchor.align(to: descriptionLabel.bottomAnchor, offset: 28)
        priceDetailsLabel.leftAnchor.align(to: leftAnchor, offset: 20)
        priceDetailsLabel.rightAnchor.align(to: rightAnchor, offset: -10)
        priceDetailsLabel.bottomAnchor.align(to: bottomAnchor, offset: -10)
    }
    
    func setupText(price: String, title: String) {
        titleLabel.text = title
        let stringFormatting = NSMutableAttributedString()
        stringFormatting
            .normal("₦ \(price)  ", font: UIFont.setSemiBoldItaticFont(of: 18), textColor: UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1))
            .bold("@ 14 per Sq.Ft\n", font: UIFont(name: "Lato-Light", size: 14)!, textColor: UIColor(red: 0.27, green: 0.2, blue: 0.2, alpha: 1))
            .bold("Per Month", font: UIFont.setFont(of: 15), textColor: UIColor(red: 0.27, green: 0.2, blue: 0.2, alpha: 1))
        
        priceDetailsLabel.attributedText = stringFormatting
    }
    
}
