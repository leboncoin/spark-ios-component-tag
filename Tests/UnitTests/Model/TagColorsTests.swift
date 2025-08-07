//
//  TagColorsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) @testable import SparkTheming
import SparkTheme

final class TagColorsTests: XCTestCase {

    // MARK: - Tests

    func test_default_values() {
        // GIVEN / WHEN
        let colors = TagColors()

        // THEN
        XCTAssertTrue(colors.backgroundColor.equals(ColorTokenClear()))
        XCTAssertTrue(colors.borderColor.equals(ColorTokenClear()))
        XCTAssertTrue(colors.foregroundColor.equals(ColorTokenClear()))
    }

    func test_equal() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            foregroundColor: colors.feedback.info)

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            foregroundColor: colors.feedback.info)

        // THEN
        XCTAssertEqual(colors1, colors2)
    }

    func test_not_equal() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            foregroundColor: colors.feedback.info)

        let colors2 = TagColors(
            backgroundColor: colors.base.background,
            borderColor: colors.main.main,
            foregroundColor: colors.feedback.alert)

        // THEN
        XCTAssertNotEqual(colors1, colors2)
    }
}
