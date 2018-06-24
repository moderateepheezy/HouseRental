//
//  Constants.swift
//  HouseRent
//
//  Created by SimpuMind on 6/23/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    
    static let shared = Constants()
    static let primaryColor = UIColor(red: 0.28, green: 0.53, blue: 1, alpha: 1)
    static let bottomTabInActiveColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    
    func downloadImage(url: URL, completetion: @escaping (UIImage?, String?) -> ()){
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: url) { (data, response, error) in
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                if let _ = response as? HTTPURLResponse {
                    if let imageData = data {
                        let image = UIImage(data: imageData)
                        if image != nil {
                            DispatchQueue.main.async {
                                completetion(image, nil)
                            }
                        }else{
                            DispatchQueue.main.async {
                                completetion(nil, "Error")
                            }
                        }
                    } else {
                        DispatchQueue.main.async {
                            completetion(nil, "Error")
                        }
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
    }
}
