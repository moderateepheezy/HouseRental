//
//  FeatureCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class FeatureCell: UITableViewCell {

    private lazy var iconImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Constants.primaryColor
        label.font = UIFont.setBoldFont(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var roomDetailsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor(red: 0.27, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont.setFont(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        [iconImageView, titleLabel, roomDetailsLabel].forEach {addSubview($0)}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        iconImageView.topAnchor.align(to: topAnchor, offset: 10)
        iconImageView.leftAnchor.align(to: leftAnchor, offset: 20)
        iconImageView.heightAnchor.equal(to: 18)
        iconImageView.widthAnchor.equal(to: 18)
        
        titleLabel.topAnchor.align(to: topAnchor, offset: 10)
        titleLabel.leftAnchor.align(to: iconImageView.rightAnchor, offset: 13)
        titleLabel.rightAnchor.align(to: rightAnchor, offset: -20)
        titleLabel.heightAnchor.equal(to: 15)
        
        roomDetailsLabel.leftAnchor.align(to: leftAnchor, offset: 48)
        roomDetailsLabel.rightAnchor.align(to: rightAnchor, offset: -10)
        roomDetailsLabel.topAnchor.align(to: titleLabel.bottomAnchor, offset: 10)
        roomDetailsLabel.bottomAnchor.align(to: bottomAnchor, offset: -10)
    }
    
    func configCell(feature: Feature){
        iconImageView.image = feature.icon
        titleLabel.text = feature.title
        roomDetailsLabel.text = feature.roomdescription
    }
}
