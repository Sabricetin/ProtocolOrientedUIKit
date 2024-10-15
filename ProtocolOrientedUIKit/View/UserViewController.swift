//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 13.10.2024.
//

import UIKit

class UserViewController: UIViewController , UserViewModelProtocol {
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = userName
        self.emailLabel.text = email
    }
    

    private let  viewModel : UserViewModel
    
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

    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupViews()
     // fetchUsers()
        viewModel.fetcUsers()
        
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
/*
    private func fetchUsers() {
        APIManager.shared.fetcUser { result in
            switch result {
            case .success(let user):
                self.usernameLabel.text = user.username
                self.emailLabel.text = user.email
                self.nameLabel.text = user.username
            case .failure(_):
                self.nameLabel.text = "No user found"
            }
        }
    } */
}

