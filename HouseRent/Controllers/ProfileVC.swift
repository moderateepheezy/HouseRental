//
//  ProfileVC.swift
//  HouseRent
//
//  Created by SimpuMind on 6/25/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    private lazy var headerView: UIView = {
       let view = UIView()
        view.backgroundColor = Constants.primaryColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [headerView].forEach {view.addSubview($0)}
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTransparentNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.topAnchor.align(to: view.topAnchor)
        headerView.leftAnchor.align(to: view.leftAnchor)
        headerView.rightAnchor.align(to: view.rightAnchor)
        headerView.heightAnchor.equal(to: 210)
    }
}
