//
//  FilterItemCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/25/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class FilterItemCell: UICollectionViewCell {
    
    var isClicked = false
    
    private lazy var itemButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(UIColor(red: 0.2, green: 0.23, blue: 0.27, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.setFont(of: 12)
        button.addTarget(self, action: #selector(handleToggle), for: .touchUpInside)
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.clear.cgColor
        button.backgroundColor = UIColor(red: 0.66, green: 0.72, blue: 0.78, alpha: 0.15)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(itemButton)
        backgroundColor = .clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        itemButton.center(in: self)
        itemButton.leftAnchor.align(to: leftAnchor, offset: 10)
        itemButton.rightAnchor.align(to: rightAnchor, offset: -10)
        itemButton.heightAnchor.equal(to: 40)
    }
    
    @objc private func handleToggle(){
        isClicked = !isClicked
        if isClicked {
            itemButton.layer.borderWidth = 2
            itemButton.layer.borderColor = Constants.primaryColor.cgColor
            itemButton.backgroundColor = .white
        } else {
            itemButton.layer.borderWidth = 0
            itemButton.layer.borderColor = UIColor.clear.cgColor
            itemButton.backgroundColor = UIColor(red: 0.66, green: 0.72, blue: 0.78, alpha: 0.15)
        }
    }
    func configCell(item: String){
        itemButton.setTitle(item, for: .normal)
    }
    
}
