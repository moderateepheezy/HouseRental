//
//  AppDelegate.swift
//  HouseRent
//
//  Created by SimpuMind on 6/22/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        UITabBar.appearance().tintColor = Constants.primaryColor
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = .white
        
        UITabBar.appearance().selectionIndicatorImage = getImageWithColorPosition(color: Constants.primaryColor, size: CGSize(width:(((self.window?.frame.size.width)!/4 ) / 2),height: 49), lineSize: CGSize(width:(((self.window?.frame.size.width)!/4) / 2), height:3))
        
        window?.rootViewController = MainTabViewController()
        
//        for family: String in UIFont.familyNames{
//            print("\(family)")
//            for names: String in UIFont.fontNames(forFamilyName: family)
//            {
//                print("== \(names)")
//            }
//        }

        return true
    }
    
    func getImageWithColorPosition(color: UIColor, size: CGSize, lineSize: CGSize) -> UIImage {
        
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let rectLine = CGRect(x: 0, y: size.height-lineSize.height, width: lineSize.width, height: lineSize.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.clear.setFill()
        UIRectFill(rect)
        color.setFill()
        UIRectFill(rectLine)
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }

}

