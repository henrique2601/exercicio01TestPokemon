//
//  Exercicio01TestUITests.swift
//  Exercicio01TestUITests
//
//  Created by Paulo Henrique dos Santos on 29/02/16.
//  Copyright © 2016 Paulo Henrique dos Santos. All rights reserved.
//

import XCTest

class Exercicio01TestUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        let app = XCUIApplication()
        app.textFields["User"].tap()
        
        let xlzrfevImage = app.images["xLZrFev"]
        xlzrfevImage.tap()
        app.textFields["Passoword"].tap()
        xlzrfevImage.tap()
        app.buttons["Login"].tap()
        xlzrfevImage.tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
