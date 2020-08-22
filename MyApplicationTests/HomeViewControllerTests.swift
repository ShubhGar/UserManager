//
//  HomeViewControllerTests.swift
//  MyApplicationTests
//
//  Created by Shubham Garg on 31/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import XCTest

@testable import MyApplication



class HomeViewControllerTests: XCTestCase {
    
    var viewModelObj: UserListViewModel!
    var mockDelegateObj:UserDataViewerProtocolMock!

    override func setUp() {
        self.mockDelegateObj = UserDataViewerProtocolMock()
        self.viewModelObj = UserListViewModel(delegate:  self.mockDelegateObj)
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLoadnextdata(){
        let expectation = self.expectation(description: "callback")
        self.mockDelegateObj.asyncExpectation = expectation
        self.viewModelObj.fetchNextData()
        
        waitForExpectations(timeout: 30) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
            guard let result = self.mockDelegateObj.asyncBool else {
                XCTFail("Expected delegate to be called")
                return
            }
            XCTAssertTrue(result)
        }
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
