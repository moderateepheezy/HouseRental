//
//  PageCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
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
        iv.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        iv.layer.cornerRadius = 5
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(coverView)
        coverView.addSubview(apartmentImageView)
        backgroundColor = .clear
    }
    
    public func configCell(imageURL: String){
        let url = URL(string: imageURL)!
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
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        coverView.topAnchor.align(to: topAnchor, offset: 5)
        coverView.leftAnchor.align(to: leftAnchor, offset: 5)
        coverView.rightAnchor.align(to: rightAnchor, offset: -5)
        coverView.bottomAnchor.align(to: bottomAnchor, offset: -10)
        
        apartmentImageView.fill(coverView)
    }
}
