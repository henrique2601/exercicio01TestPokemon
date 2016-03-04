//
//  AccountManagerTest.swift
//  Exercicio01Test
//
//  Created by Paulo Henrique dos Santos on 02/03/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest
@testable import Exercicio01Test

class AccountManagerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testLoginTrue() {
        XCTAssertTrue(AccountManager.sharedInstance.login("rodrigo", password: "1234"), "Check login true...")
    }
    

}
