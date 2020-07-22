//
//  UITestsSupport.swift
//  MarvelBattleUITests
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import XCTest

class UITestsSupport {
    
    var app: XCUIApplication!
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func tapInFirstTableView() {
        let tableView = app.tables.firstMatch
        let _ = tableView.waitForExistence(timeout: 10)
        let _ = tableView.cells.element(boundBy: 0).waitForExistence(timeout: 10)
        tableView.cells.element(boundBy: 0).tap()
    }
    
    func hideKeyboard() {
        if app.keys.element(boundBy: 0).exists {
            app.typeText("\n")
        }
    }

}
