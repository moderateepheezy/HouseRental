//
//  PriceRangeCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/25/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class PriceRangeCell: UITableViewCell {

    
    private lazy var priceRangeLabel: UILabel = {
        let label = UILabel()
        label.text = "Price range: 10,000 - 20,000"
        label.font = UIFont.setBoldFont(of: 12)
        label.textColor = UIColor(red: 0.2, green: 0.23, blue: 0.27, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceRangeSeeker: RangeSeekSlider = {
       let seeker = RangeSeekSlider()
        seeker.handleImage = #imageLiteral(resourceName: "handle")
        seeker.colorBetweenHandles = Constants.primaryColor
        seeker.tintColor = UIColor(red: 0.66, green: 0.72, blue: 0.78, alpha: 0.3)
        seeker.maxLabelFont = UIFont.setBoldFont(of: 12)
        seeker.minLabelFont = UIFont.setBoldFont(of: 12)
        seeker.maxLabelColor = UIColor(red: 0.2, green: 0.23, blue: 0.27, alpha: 1)
        seeker.minLabelColor = UIColor(red: 0.2, green: 0.23, blue: 0.27, alpha: 1)
        seeker.lineHeight = 5
        seeker.maxValue = 400000
        seeker.minValue = 20000
        seeker.selectedMaxValue = 200000
        seeker.selectedMinValue = 30000
        seeker.translatesAutoresizingMaskIntoConstraints = false
        return seeker
    }()
    
    private lazy var doneButton: UIButton = {
       let button = UIButton()
        button.setTitle("Done", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.setBoldFont(of: 14)
        button.layer.cornerRadius = 19
        button.backgroundColor = Constants.primaryColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [priceRangeSeeker, priceRangeLabel, doneButton].forEach {addSubview($0)}
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        priceRangeSeeker.topAnchor.align(to: topAnchor, offset: 20)
        priceRangeSeeker.leftAnchor.align(to: leftAnchor, offset: 20)
        priceRangeSeeker.rightAnchor.align(to: rightAnchor, offset: -20)
        priceRangeSeeker.heightAnchor.equal(to: 40)
        
        priceRangeLabel.rightAnchor.align(to: rightAnchor, offset: -20)
        priceRangeLabel.leftAnchor.align(to: leftAnchor, offset: 20)
        priceRangeLabel.topAnchor.align(to: priceRangeSeeker.bottomAnchor)
        priceRangeLabel.heightAnchor.equal(to: 13)
        
        doneButton.leftAnchor.align(to: leftAnchor, offset: 10)
        doneButton.bottomAnchor.align(to: bottomAnchor)
        doneButton.widthAnchor.equal(to: 86)
        doneButton.heightAnchor.equal(to: 38)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
