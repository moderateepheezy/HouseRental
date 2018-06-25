//
//  FilterVC.swift
//  HouseRent
//
//  Created by SimpuMind on 6/25/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class FilterVC: UIViewController {

    let getFilteItems = [
        "Tenant Type" : ["Family", "Bachelor"],
        "Looking For": ["1 BHK", "2 BHK", "3 BHK", "4 BHK", "5 BHK"],
        "Features": ["Car Parking", "2 baths", "Elevator", "24/7 Water", "24/7 Electricity"]
    ]
    
    var keys = [String]()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.font = UIFont.setFont(of: 14)
        tf.borderStyle = .none
        tf.placeholder = "Type location"
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var parentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 15))
        imageView.image = #imageLiteral(resourceName: "search_icon")
        imageView.contentMode = .scaleAspectFit
        searchTextField.leftViewMode = .always
        searchTextField.leftView = imageView
        [headerView, parentView, tableView].forEach {view.addSubview($0)}
        [searchView].forEach {headerView.addSubview($0)}
        searchView.addSubview(searchTextField)
        parentView.addSubview(containerView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FilterByCell.self, forCellReuseIdentifier: "cell")
        tableView.register(PriceRangeCell.self, forCellReuseIdentifier: "priceRangeCell")
        keys = Array(self.getFilteItems.keys)
        keys.append("Price Range")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        view.layoutIfNeeded()
        containerView.layer.addBorder(edge: .top, color: Constants.primaryColor, thickness: 3)
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
        headerView.heightAnchor.equal(to: 120)
        
        searchView.topAnchor.align(to: headerView.topAnchor, offset: 36)
        searchView.leftAnchor.align(to: headerView.leftAnchor, offset: 12)
        searchView.rightAnchor.align(to: headerView.rightAnchor, offset: -12)
        searchView.heightAnchor.equal(to: 36)
        
        searchTextField.leftAnchor.align(to: searchView.leftAnchor, offset: 10)
        searchTextField.rightAnchor.align(to: searchView.rightAnchor, offset: -10)
        searchTextField.topAnchor.align(to: searchView.topAnchor)
        searchTextField.bottomAnchor.align(to: searchView.bottomAnchor)
        
        parentView.fill(view)
        
        containerView.topAnchor.align(to: parentView.topAnchor, offset: 80)
        containerView.leftAnchor.align(to: parentView.leftAnchor)
        containerView.rightAnchor.align(to: parentView.rightAnchor)
        containerView.bottomAnchor.align(to: parentView.bottomAnchor)
        
        
        tableView.topAnchor.align(to: containerView.topAnchor, offset: 20)
        tableView.leftAnchor.align(to: containerView.leftAnchor)
        tableView.rightAnchor.align(to: containerView.rightAnchor)
        tableView.bottomAnchor.align(to: containerView.bottomAnchor)
    }

}

extension FilterVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == keys.count - 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceRangeCell", for: indexPath) as! PriceRangeCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilterByCell
                cell.items = getFilteItems[keys[indexPath.section]]!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = keys[section]
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        headerView.backgroundColor = .clear
        let label = UILabel(frame: CGRect(x: 22, y:0, width: tableView.bounds.size.width, height: 44))
        label.backgroundColor = .clear
        label.font = UIFont.setBoldFont(of: 14)
        label.textColor = UIColor(red: 0.2, green: 0.23, blue: 0.27, alpha: 1)
        label.text = title
        headerView.addSubview(label)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == keys.count - 1 {
            return 150
        }
        return 60
    }
}
