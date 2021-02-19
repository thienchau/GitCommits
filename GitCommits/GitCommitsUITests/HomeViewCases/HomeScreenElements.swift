//
//  HomeScreenElements.swift
//  GitCommitsUITests
//
//  Created by Duy Thien Chau on 2/18/21.
//

import Foundation
import XCTest

enum HomeScreenElements: String {
    
    case indicator = "activityIndicatorView"
    case firstAuthorLabel = "Jon Shier"
    case firstSHALabel = "b5dfb35435af5d68aeca5dfad2a069e1a8aedc57"
    
    var element: XCUIElement {
        switch self {
        case .indicator:
            return XCUIApplication.shared.activityIndicators[self.rawValue]
        case .firstAuthorLabel,
             .firstSHALabel:
            return XCUIApplication.shared.staticTexts[self.rawValue]
        }
    }
}
