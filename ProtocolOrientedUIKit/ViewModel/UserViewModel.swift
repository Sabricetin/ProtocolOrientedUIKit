//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 15.10.2024.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    weak var output : UserViewModelProtocol?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetcUsers() {
        
        userService.fetcUser { [weak self] result in
            switch result {
            case .success(let user) :
                self?.output?.updateView(name: user.name, email: user.email, userName: user.username)
            case.failure(_):
                self?.output?.updateView(name: "No User", email: "", userName: "")
            }
        }
    }
    
}
