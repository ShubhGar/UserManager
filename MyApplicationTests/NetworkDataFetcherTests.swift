//
//  NetworkDataFetcherTests.swift
//  MyApplicationTests
//
//  Created by Shubham Garg on 31/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import XCTest
@testable import MyApplication

class NetworkDataFetcherTests: XCTestCase {
    
    var dataFetcher:NetworkDataFetcher?
    override func setUp() {
        dataFetcher = NetworkDataFetcher.shared
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRequestDataWithIncorrectURL() {
        let expect = XCTestExpectation(description: "callback")
        dataFetcher?.requestData(url: URL(string: "https://reqres.in/api/users?page=")!, completion: { (result) in
            expect.fulfill()
            switch result {
            case .success( _) :
                XCTAssertTrue(true)
            case .failure( _) :
               XCTAssertTrue(false)
                break
            }
        })
        wait(for: [expect], timeout: 60.0)
    }
    
    func testRequestDataWithSuccess() {
        let expect = XCTestExpectation(description: "callback")
        dataFetcher?.requestData(url: URL(string: "https://reqres.in/api/users?page=1")!, completion: { (result) in
            expect.fulfill()
            switch result {
            case .success( let data) :
                XCTAssertNotNil(data)
            case .failure( _) :
               XCTAssertTrue(false)
                break
            }
        })
        wait(for: [expect], timeout: 60.0)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
