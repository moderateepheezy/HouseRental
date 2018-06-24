//
//  Rental.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import Foundation

struct Rental: Codable {
    let blocks: [Block]
}

struct Block: Codable {
    let name: String
    let children: [Apartment]
}

struct Apartment: Codable {
    let name, price, imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case name, price
        case imageURL = "image_url"
    }
}
