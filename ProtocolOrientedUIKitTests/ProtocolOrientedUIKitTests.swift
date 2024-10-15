//
//  ProtocolOrientedUIKitTests.swift
//  ProtocolOrientedUIKitTests
//
//  Created by Sabri Çetin on 13.10.2024.
//

import XCTest
@testable import ProtocolOrientedUIKit

final class ProtocolOrientedUIKitTests: XCTestCase {
    
    private var userViewmodel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!
    

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewmodel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewmodel.output = output
        
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewmodel = nil
    }

    func testUpdateView_WhenAPISuccess_ShowsEmailNameUserName() throws {
       
        let mockUser = User(id: 1, name: "sabri", username: "cetin", email: "sabricetin@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        userViewmodel.fetcUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "cetin")
        
        
    }

    func testUpdateView_WhenAPIFAilure_ShowsNoUser() throws {
       
        userService.fetchUserMockResult = .failure(NSError())
        userViewmodel.fetcUsers()
        XCTAssertEqual(output.updateViewArray.first?.name, "No User")
        
    }
    
}


class MockUserService : UserService {
    var fetchUserMockResult : Result<ProtocolOrientedUIKit.User, any Error>?
    func fetcUser(completion: @escaping (Result<ProtocolOrientedUIKit.User, any Error>) -> Void) {
        if let result = fetchUserMockResult {
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutput : UserViewModelProtocol  {
    var updateViewArray : [ (name:String,email:String,userName:String)]=[]
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name , email , userName))
    }
}
