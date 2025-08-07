//
//  TagConstantsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag

final class TagConstantsTests: XCTestCase {

    // MARK: - Tests

    func test_iconSizeConstant() {
        XCTAssertEqual(TagConstants.iconSize, 12)
    }
}
