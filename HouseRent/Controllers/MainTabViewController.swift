//
//  MainTabViewController.swift
//  HouseRent
//
//  Created by SimpuMind on 6/22/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        tabBar.backgroundColor = .white
        tabBar.barStyle = .black
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 0)
        tabBar.layer.shadowRadius = 2
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.3
        setupBarItems()
        let tabBarItemApperance = UITabBarItem.appearance()
        tabBarItemApperance.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Avenir-Black", size: 10)!, NSAttributedStringKey.foregroundColor: Constants.bottomTabInActiveColor], for: .normal)
        tabBarItemApperance.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Avenir-Black", size: 10)!, NSAttributedStringKey.foregroundColor: Constants.primaryColor], for: .selected)
    }
    
    private func setupBarItems(){
        let controller1 = HomeVC()
        controller1.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "home"), tag: 1)
        let nav1 = UINavigationController(rootViewController: controller1)
        nav1.hidesBottomBarWhenPushed = true
        
        let controller2 = HomeVC()
        controller2.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "filter"), tag: 2)
        let nav2 = UINavigationController(rootViewController: controller2)
        nav2.hidesBottomBarWhenPushed = true
        
        let controller3 = HomeVC()
        controller3.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "notification"), tag: 3)
        let nav3 = UINavigationController(rootViewController: controller3)
        nav3.hidesBottomBarWhenPushed = true
        
        let controller4 = HomeVC()
        controller4.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "profile"), tag: 3)
        let nav4 = UINavigationController(rootViewController: controller4)
        nav4.hidesBottomBarWhenPushed = true
        
        viewControllers = [nav1, nav2, nav3, nav4]
        
    }

}
