//
//  TagBorderTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag

final class TagBorderTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let border = TagBorder()

        // THEN
        XCTAssertEqual(border.width, 0)
        XCTAssertEqual(border.radius, 0)
    }
}
