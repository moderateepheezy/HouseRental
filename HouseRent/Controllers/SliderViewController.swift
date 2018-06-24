//
//  SliderViewController.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SliderViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let pages = [
        "https://az616578.vo.msecnd.net/files/2016/07/26/636050962570138758-2091420308_Elegant-apartment-finder.jpg",
        "http://www.offlineproperty.com/images/property/apartment_Chennai_4037(0).pjpeg",
        "https://res.cloudinary.com/apartmentlist/image/upload/t_fullsize/e12ca8cfd341775334b58afb9e413b7b.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9WWa2dX-Sl26SQmcMItz5s1Pbo0TI12ck7umpxma96T8ZnfGG",
        "https://www.xiaozhouzaixian.com/wp-content/uploads/2015/02/How-To-Promote-An-Apartment-For-Rent.jpg"
    ]
    var currentPageNumber: Int = 1
    
    private lazy var pageNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.setBoldFont(of: 14)
        label.text = "1/5"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .clear
        view.addSubview(pageNumberLabel)
        collectionView?.contentInsetAdjustmentBehavior = .never
        collectionView?.backgroundColor = .clear
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isPagingEnabled = true
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        currentPageNumber = Int(x)
        
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.currentPageNumber == 0 {
                self.collectionView?.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.currentPageNumber, section: 0)
                self.collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
    }
    
    override func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        guard let collectionView = collectionView else {return}
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let visibleIndexPath: IndexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }
        pageNumberLabel.text = "\(visibleIndexPath.item + 1)/\(pages.count)"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageNumberLabel.bottomAnchor.align(to: view.bottomAnchor, offset: -18)
        pageNumberLabel.rightAnchor.align(to: view.rightAnchor, offset: -18)
        pageNumberLabel.heightAnchor.equal(to: 15)
        pageNumberLabel.widthAnchor.equal(to: 200)
    }

    // MARK: UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.configCell(imageURL: page)
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected something")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }

}
