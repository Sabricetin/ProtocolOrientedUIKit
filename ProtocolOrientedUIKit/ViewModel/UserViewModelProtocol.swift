//
//  UserViewModelProtocol.swift
//  ProtocolOrientedUIKit
//
//  Created by Sabri Çetin on 15.10.2024.
//

import Foundation


protocol UserViewModelProtocol : AnyObject {
    func updateView (name: String , email : String , userName : String)
}
