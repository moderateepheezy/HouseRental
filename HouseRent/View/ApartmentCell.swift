//
//  ApartmentCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/23/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class ApartmentCell: UICollectionViewCell {
    
    private lazy var containerView: CardView = {
       let view = CardView()
        view.cornerRadius = 5
        view.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.31)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coverView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.2602472175)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var apartmentImageView: UIImageView = {
       let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 5
        iv.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var priceLabel: UILabel = {
      let label = UILabel()
        label.textColor = .white
        label.font = UIFont.setBlackFont(of: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var apartmentNameLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.setFont(of: 14)
        label.numberOfLines = 3
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(containerView)
        containerView.addSubview(apartmentImageView)
        addSubview(coverView)
        backgroundColor = .clear
    }
    
    public func configCell(apartment: Apartment){
        priceLabel.text = apartment.price
        apartmentNameLabel.text = apartment.name
        let url = URL(string: apartment.imageURL)!
        Constants.shared.downloadImage(url: url) { (image, error) in
            guard let image = image else{
                return
            }
            self.apartmentImageView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        apartmentImageView.image = nil
        priceLabel.text = ""
        apartmentNameLabel.text = ""
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        containerView.topAnchor.align(to: topAnchor, offset: 5)
        containerView.leftAnchor.align(to: leftAnchor, offset: 5)
        containerView.rightAnchor.align(to: rightAnchor, offset: -5)
        containerView.bottomAnchor.align(to: bottomAnchor, offset: -20)
        
        coverView.topAnchor.align(to: topAnchor, offset: 5)
        coverView.leftAnchor.align(to: leftAnchor, offset: 5)
        coverView.rightAnchor.align(to: rightAnchor, offset: -5)
        coverView.bottomAnchor.align(to: bottomAnchor, offset: -25)
        
        apartmentImageView.fill(containerView)
        setupImpression()
    }
    
    fileprivate func setupImpression(){
        let stackView = UIStackView(arrangedSubviews: [priceLabel, apartmentNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 10
        
        coverView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10)
        ])
    }
}
