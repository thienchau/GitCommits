//
//  UITestBase.swift
//  GitCommitsUITests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import XCTest

class UITestBase: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func XCTAsyncAssert(_ element: XCUIElement) {
        let isElementExist = element.waitForExistence(timeout: 2)
        XCTAssert(isElementExist)
    }
    
    func captureScreenShot(name: String) {
        let screenshot = app.screenshot()
        let attachment = XCTAttachment(screenshot: screenshot)
        attachment.name = name
        attachment.lifetime = .keepAlways
        add(attachment)
    }
    
    func pause(_ time: Int) -> Self {
        _ = sleep(UInt32(time))
        return self
    }
    
}

extension XCUIApplication {
    static var shared = XCUIApplication()
}
