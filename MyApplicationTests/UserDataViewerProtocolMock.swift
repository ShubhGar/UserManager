//
//  UserDataViewerProtocolMock.swift
//  MyApplicationTests
//
//  Created by Shubham Garg on 31/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation
import XCTest
@testable import MyApplication


class UserDataViewerProtocolMock: UserDataViewerProtocol {
     // Setting .None is unnecessary, but helps with clarity imho
    var asyncBool: Bool?
    var asyncExpectation: XCTestExpectation?
    func updateUsers(users: UserViewModels) {
        guard let expectation = asyncExpectation else {
          XCTFail("Not setup correctly")
          return
        }
        asyncBool = true
        expectation.fulfill()
    }
    func showError(message: String) {
        guard let expectation = asyncExpectation else {
          XCTFail("Not setup correctly")
          return
        }
        asyncBool = false
        expectation.fulfill()
    }

}
