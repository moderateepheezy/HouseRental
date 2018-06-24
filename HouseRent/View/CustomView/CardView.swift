//
//  CardView.swift
//  HouseRent
//
//  Created by SimpuMind on 6/23/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 5
    @IBInspectable var shadowRaduis: CGFloat = 10
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 9
     @IBInspectable var shadowColor: UIColor? = .black
    @IBInspectable var shadowOpacity: Float = 0.6
    
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        layer.shadowRadius = shadowRaduis
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        layer.position = center
    }
    
}
