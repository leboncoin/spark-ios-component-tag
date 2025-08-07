//
//  TagSizeTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag

final class TagSizeTests: XCTestCase {

    // MARK: - Tests

    func test_default() {
        XCTAssertEqual(TagSize.default, .medium)
    }
}
