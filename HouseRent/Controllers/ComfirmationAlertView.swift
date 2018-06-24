//
//  ComfirmationAlertView.swift
//  HouseRent
//
//  Created by SimpuMind on 6/24/18.
//  Copyright © 2018 SimpuMind. All rights reserved.
//

import UIKit

protocol ComfirmationAlertViewDelegate: class {
    func okButtonTapped(phoneNumber: String)
}

class ComfirmationAlertView: UIViewController {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var markIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "check")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello VICKEY!"
        label.textColor = UIColor(red: 0.19, green: 0.19, blue: 0.19, alpha: 1)
        label.font = UIFont.setBoldFont(of: 22)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yourContactLabel: UILabel = {
        let label = UILabel()
        label.attributedText = setupText()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var callNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Call: +2347064637580"
        label.alpha = 0.8
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        label.font = UIFont.setSemiBoldItaticFont(of: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var contactOwnersButton: UIButton = {
        let button = UIButton()
        button.setTitle("Call", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.setSemiBoldItaticFont(of: 15)
        button.backgroundColor = Constants.primaryColor
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(onCallOwner), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let alertViewGrayColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1)
    var delegate: ComfirmationAlertViewDelegate?


    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(containerView)
        [markIconImageView, usernameLabel,
         yourContactLabel, callNumberLabel,
         contactOwnersButton].forEach {containerView.addSubview($0)}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
        animateView()
    }
    
    func setupView() {
        containerView.layer.cornerRadius = 15
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    func animateView() {
        containerView.alpha = 0;
        self.containerView.frame.origin.y = self.containerView.frame.origin.y + 50
        UIView.animate(withDuration: 0.4) {
            self.containerView.alpha = 1.0
            self.containerView.frame.origin.y = self.containerView.frame.origin.y - 50
        }
        
    }
    
    @objc private func onCallOwner(){
        delegate?.okButtonTapped(phoneNumber: "+2347064637580")
        self.dismiss(animated: true, completion: nil)
    }
    
    func setupText() -> NSMutableAttributedString {
        let stringFormatting = NSMutableAttributedString()
        stringFormatting
            .normal("Your contact person name is\n", font: UIFont.setFont(of: 14), textColor: UIColor(red: 0.37, green: 0.37, blue: 0.37, alpha: 1))
            .bold("Karthick", font: UIFont.setBoldFont(of: 14), textColor: UIColor(red: 0.27, green: 0.2, blue: 0.2, alpha: 1))
        return stringFormatting
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        view.layoutIfNeeded()
        
        containerView.center(in: view)
        containerView.leftAnchor.align(to: view.leftAnchor, offset: 20)
        containerView.rightAnchor.align(to: view.rightAnchor, offset: -20)
        containerView.heightAnchor.equal(to: 356)
        
        markIconImageView.topAnchor.align(to: containerView.topAnchor, offset: 46)
        markIconImageView.centerXAnchor.align(to: containerView.centerXAnchor)
        markIconImageView.widthAnchor.equal(to: 67)
        markIconImageView.heightAnchor.equal(to: 67)
        
        usernameLabel.topAnchor.align(to: markIconImageView.bottomAnchor, offset: 18)
        usernameLabel.centerXAnchor.align(to: containerView.centerXAnchor)
        usernameLabel.leftAnchor.align(to: containerView.leftAnchor, offset: 80)
        usernameLabel.rightAnchor.align(to: containerView.rightAnchor, offset: -80)
        usernameLabel.heightAnchor.equal(to: 20)
        
        yourContactLabel.topAnchor.align(to: usernameLabel.bottomAnchor, offset: 15)
        yourContactLabel.centerXAnchor.align(to: containerView.centerXAnchor)
        yourContactLabel.leftAnchor.align(to: containerView.leftAnchor, offset: 80)
        yourContactLabel.rightAnchor.align(to: containerView.rightAnchor, offset: -80)
        yourContactLabel.heightAnchor.equal(to: 60)
        
        callNumberLabel.centerXAnchor.align(to: containerView.centerXAnchor)
        callNumberLabel.widthAnchor.equal(to: 200)
        callNumberLabel.heightAnchor.equal(to: 17)
        callNumberLabel.topAnchor.align(to: yourContactLabel.bottomAnchor, offset: 10)
        
        contactOwnersButton.topAnchor.align(to: callNumberLabel.bottomAnchor, offset: 20)
        contactOwnersButton.leftAnchor.align(to: containerView.leftAnchor, offset: 26)
        contactOwnersButton.rightAnchor.align(to: containerView.rightAnchor, offset: -26)
        contactOwnersButton.heightAnchor.equal(to: 56)
        
    }

}
