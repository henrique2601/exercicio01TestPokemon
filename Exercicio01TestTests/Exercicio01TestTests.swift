//
//  Exercicio01TestTests.swift
//  Exercicio01TestTests
//
//  Created by Paulo Henrique dos Santos on 29/02/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest
@testable import Exercicio01Test

class Exercicio01TestTests: XCTestCase {
    
    var vc:ViewController!
    
    override func setUp() {
        super.setUp()
        
        var storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        vc = storyboard.instantiateViewControllerWithIdentifier("MainViewController") as! ViewController
        vc.loadView()
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
    
    func testLogin() {
        self.vc.txtPassword.text = "mistyS2"
        self.vc.txtUser.text = "ash"
        self.vc.btnLoginTouch(self.vc)
    }
    
    func testLoginFail() {
        self.vc.txtPassword.text = "sdffsd"
        self.vc.txtUser.text = "ash"
        self.vc.btnLoginTouch(self.vc)
    }
    
    func testLoginInvalidChar() {
        self.vc.txtPassword.text = "sdf fsd"
        self.vc.txtUser.text = "a sh"
        self.vc.btnLoginTouch(self.vc)
    }
    
    func testBadJason() {
        let badJason = ["teste" : 1]
        _ = Trainer(json: badJason)
    }

    
    
}
