//
//  TagSpacingsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag

final class TagSpacingsTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let spacings = TagSpacings()

        // THEN
        XCTAssertEqual(spacings.horizontalPadding, 0)
        XCTAssertEqual(spacings.horizontalSpacing, 0)
    }
}
