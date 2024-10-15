//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 15.10.2024.
//

import Foundation


protocol UserService {
    func fetcUser (completion : @escaping(Result<User,Error>) -> Void )
}
