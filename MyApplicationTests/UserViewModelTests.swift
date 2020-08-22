//
//  UserViewModelTests.swift
//  MyApplicationTests
//
//  Created by Shubham Garg on 31/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import XCTest
@testable import MyApplication


class UserViewModelTests: XCTestCase {
    
    var userModelObj:UserViewModel?

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let userObj = User(email: "test@yyz.com", first_name:"fname", last_name: "lName", avatar: "etx", id:1)
        self.userModelObj = UserViewModel(user: userObj)
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserEmail(){
        guard let returnValue = userModelObj?.isValid(email: userModelObj?.userEmail ?? "") else { return  }
        XCTAssertTrue( returnValue)
    }
    
    func testIncorrectUserEmail(){
        guard let returnValue = userModelObj?.isValid(email: "abc") else { return  }
        XCTAssertFalse( returnValue)
    }
    
    func testUserMobile(){
        guard let returnValue = userModelObj?.isValid(mobileNumber: userModelObj?.mobileNo ?? "") else { return  }
        XCTAssertTrue( returnValue)
    }
    
    func testIncorrectUserMobile(){
        guard let returnValue = userModelObj?.isValid(mobileNumber: "123") else { return  }
        XCTAssertFalse( returnValue)
    }



}
