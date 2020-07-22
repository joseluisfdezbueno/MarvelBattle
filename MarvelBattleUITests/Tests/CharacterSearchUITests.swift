//
//  MarvelBattleUITests.swift
//  MarvelBattleUITests
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import XCTest

class MarvelBattleUITests: XCTestCase {

    var app: XCUIApplication!
    var uiSupport: UITestsSupport!
    
    override func setUp() {
        self.app = XCUIApplication()
        self.uiSupport = UITestsSupport(app: self.app)
        self.app.launch()
    }

    override func tearDown() { }
    
    func testNavigateToCharacterProfile() {
        // Given: User is in Character Search View
        
        // When: User selects a character
        self.uiSupport.tapInFirstTableView()
                
        // Then: User can see the Character Profile View
        XCTAssertTrue(app.staticTexts["character_profile_name_label"].exists)
    }
        
}
