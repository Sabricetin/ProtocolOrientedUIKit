//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 13.10.2024.
//

import UIKit

class UserViewController: UIViewController {

    private let nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    } ()
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    } ()
    private let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
        
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupViews()
    }
    private func setupViews() {
        
        view.backgroundColor = .purple
        view.addSubview(emailLabel)
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        
        NSLayoutConstraint.activate(
            [
                nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: 60),
                nameLabel.widthAnchor.constraint(equalToConstant: 200),
                nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                
                emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                emailLabel.heightAnchor.constraint(equalToConstant: 60),
                emailLabel.widthAnchor.constraint(equalToConstant: 200),
                emailLabel .topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
                
                usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                usernameLabel.heightAnchor.constraint(equalToConstant: 60),
                usernameLabel.widthAnchor.constraint(equalToConstant: 200),
                usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            
            
            ]
        )
        
        
        nameLabel.text = "Name Label"
        nameLabel.textColor = .blue
        emailLabel.text = "Email Label"
        nameLabel.textColor = .cyan
        usernameLabel.text = "Name Label"
        usernameLabel.textColor = .red

    }


}

