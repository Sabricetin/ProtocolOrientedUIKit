//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 15.10.2024.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetcUsers() {
        
        userService.fetcUser { result in
            switch result {
            case .success(let user) :
                print(user)
            case.failure(_):
                print("Error")
            }
        }
    }
    
}
