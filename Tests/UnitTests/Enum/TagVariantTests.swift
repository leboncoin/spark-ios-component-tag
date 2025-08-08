//
//  TagVariantTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag

final class TagVariantTests: XCTestCase {

    // MARK: - Tests

    func test_default() {
        XCTAssertEqual(TagVariant.default, .filled)
    }
}
