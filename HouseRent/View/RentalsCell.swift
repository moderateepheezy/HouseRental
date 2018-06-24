
//
//  RentalsCell.swift
//  HouseRent
//
//  Created by SimpuMind on 6/23/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

protocol RentalDelegate {
    func didSelectRowForRentals(_ indexPath: IndexPath, section: Int)
}

class RentalsCell: UITableViewCell {
    
    var apartments = [Apartment]()
    var section: Int = 0
    
    var delegate: RentalDelegate?
    
    fileprivate let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 15)
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsHorizontalScrollIndicator = false
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(collectionView)
        backgroundColor = .clear
        selectionStyle = .none
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ApartmentCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        collectionView.topAnchor.align(to: topAnchor)
        collectionView.leftAnchor.align(to: leftAnchor, offset: 20)
        collectionView.rightAnchor.align(to: rightAnchor)
        collectionView.bottomAnchor.align(to: bottomAnchor)
    }
    
}


extension RentalsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apartments.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ApartmentCell
        cell.configCell(apartment: apartments[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectRowForRentals(indexPath, section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 230, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.right
    }
}
