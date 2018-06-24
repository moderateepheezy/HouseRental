//
//  ApartmentDetailVC.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

protocol TableViewFooterDelegate {
    func showComfirmationAlertView()
}

class ApartmentDetailVC: UIViewController {
    
    var apartment: Apartment?
    var features: [Feature] = [
        Feature(icon: #imageLiteral(resourceName: "configuration"), title: "Configuaration", roomdescription: "2 Bedrooms , 2 Bathrooms , 1 Balcony"),
        Feature(icon: #imageLiteral(resourceName: "rent"), title: "Rent in detail", roomdescription: "₦  13,500 (Negotiable)\nMaintenance ₦ 1,500/- (Monthly)"),
        Feature(icon: #imageLiteral(resourceName: "available"), title: "Available From", roomdescription: "Immediate"),
        Feature(icon: #imageLiteral(resourceName: "group"), title: "Available For", roomdescription: "Family / Bachelor"),
        Feature(icon: #imageLiteral(resourceName: "furniture"), title: "Furnishing", roomdescription: "Semifurnished"),
        Feature(icon: #imageLiteral(resourceName: "chart"), title: "Area", roomdescription: "Super Built up area 950 Sq.Ft."),
        Feature(icon: #imageLiteral(resourceName: "address"), title: "Address", roomdescription: "Arasur Avantika\nPallikaranai, Chennai South.")
    ]
    
    var headerHeightConstraint: NSLayoutConstraint!
    
    private lazy var containerView: CardView = {
       let view = CardView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 385))
        view.backgroundColor = .clear
        view.cornerRadius = 5
        view.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.31)
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
        self.addBackButton()
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PriceDetailCell.self, forCellReuseIdentifier: "cell")
        tableView.register(FeatureCell.self, forCellReuseIdentifier: "featureCell")
        tableView.tableHeaderView = containerView
        let tableViewFooter = ApartmentDetailFooter(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 119))
        tableViewFooter.delegate = self
        tableView.tableFooterView = tableViewFooter
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let vc = SliderViewController(collectionViewLayout: layout)
        vc.view.frame = containerView.frame
        vc.view.backgroundColor = .clear
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        vc.willMove(toParentViewController: self)
        
        containerView.insertSubview(vc.view, aboveSubview: containerView)
        
        addChildViewController(vc)
        vc.didMove(toParentViewController: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setTransparentNavigationBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        tableView.topAnchor.align(to: view.topAnchor, offset: -70)
        tableView.leftAnchor.align(to: view.leftAnchor, offset: -10)
        tableView.rightAnchor.align(to: view.rightAnchor, offset: 10)
        tableView.bottomAnchor.align(to: view.bottomAnchor)
    }

}

extension ApartmentDetailVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return features.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.item == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PriceDetailCell
            cell.setupText(price: apartment!.price, title: apartment!.name)
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "featureCell", for: indexPath) as! FeatureCell
        cell.configCell(feature: features[indexPath.item - 1])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return 124
        }
        return 84
    }
}

extension ApartmentDetailVC: ComfirmationAlertViewDelegate {
    func okButtonTapped(phoneNumber: String) {
        
    }
}

extension ApartmentDetailVC: TableViewFooterDelegate {
    func showComfirmationAlertView() {
        let customAlert = ComfirmationAlertView()
        customAlert.providesPresentationContextTransitionStyle = true
        customAlert.definesPresentationContext = true
        customAlert.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        customAlert.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        customAlert.delegate = self
        self.present(customAlert, animated: true, completion: nil)
    }
}

class ApartmentDetailFooter: UIView {
    
    var delegate: TableViewFooterDelegate?
    
    private lazy var contactOwnersButton: UIButton = {
       let button = UIButton()
        button.setTitle("Contact Owner", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.setSemiBoldItaticFont(of: 15)
        button.backgroundColor = Constants.primaryColor
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(handleShowOwner), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc private func handleShowOwner(){
        delegate?.showComfirmationAlertView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contactOwnersButton)
        backgroundColor = .clear
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contactOwnersButton.center(in: self)
        contactOwnersButton.leftAnchor.align(to: leftAnchor, offset: 25)
        contactOwnersButton.rightAnchor.align(to: rightAnchor, offset: -25)
        contactOwnersButton.heightAnchor.equal(to: 56)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
