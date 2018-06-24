//
//  HomeVC.swift
//  HouseRent
//
//  Created by SimpuMind on 6/22/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    var didSetupConstraints = false
    
    var blocks = [Block]()
    
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
    
    private lazy var segmentedControl: CustomSegmentedControl = {
        let sc = CustomSegmentedControl()
        sc.items = ["Near Me", "Explore City", "Popular", "View Map"]
        sc.font = UIFont.setBoldFont(of: 12)
        sc.selectedIndex = 0
        sc.backgroundColor = .white
        sc.borderSize = 2
        sc.thumbColor = Constants.primaryColor
        sc.thumUnderLineSize = 2
        sc.unselectedLabelColor = UIColor(red: 0.28, green: 0.53, blue: 1, alpha: 0.3)
        sc.selectedLabelColor = Constants.primaryColor
        //sc.selectorColor = Constants.primaryColor
        sc.translatesAutoresizingMaskIntoConstraints = false
        return sc
    }()
    
    private lazy var tableView: UITableView = {
       let tv = UITableView()
        tv.separatorStyle = .none
        tv.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
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
        [headerView, tableView].forEach {view.addSubview($0)}
        [searchView, segmentedControl].forEach {headerView.addSubview($0)}
        searchView.addSubview(searchTextField)
        
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RentalsCell.self, forCellReuseIdentifier: "cell")
        
        parseData()
    }
    
    private func parseData(){
        if let path = Bundle.main.path(forResource: "test", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let rental = try? JSONDecoder().decode(Rental.self, from: data)
                if let rental = rental {
                    DispatchQueue.main.async {
                        self.blocks = rental.blocks
                        self.tableView.reloadData()
                    }
                }
            } catch {
                // handle error
            }
        }
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
        
        segmentedControl.leftAnchor.align(to: headerView.leftAnchor)
        segmentedControl.rightAnchor.align(to: headerView.rightAnchor)
        segmentedControl.bottomAnchor.align(to: headerView.bottomAnchor)
        segmentedControl.heightAnchor.equal(to: 30)
        
        tableView.topAnchor.align(to: headerView.bottomAnchor)
        tableView.leftAnchor.align(to: view.leftAnchor)
        tableView.rightAnchor.align(to: view.rightAnchor)
        tableView.bottomAnchor.align(to: view.bottomAnchor)
    }

}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return blocks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RentalsCell
        cell.apartments = blocks[indexPath.section].children
        cell.section = indexPath.section
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let title = blocks[section].name
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 44))
        headerView.backgroundColor = view.backgroundColor
        let label = UILabel(frame: CGRect(x: 22, y:0, width: tableView.bounds.size.width, height: 44))
        label.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        label.font = UIFont.setFont(of: 11)
        label.textColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1)
        label.text = title
        headerView.addSubview(label)
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 266 + 20
    }
}

extension HomeVC: RentalDelegate {
    func didSelectRowForRentals(_ indexPath: IndexPath, section: Int) {
        let apartment = blocks[section].children[indexPath.item]
        let vc = ApartmentDetailVC()
        vc.apartment = apartment
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}
