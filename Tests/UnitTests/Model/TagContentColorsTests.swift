//
//  TagContentColorsTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
import SparkTheme

final class TagContentColorsTests: XCTestCase {

    // MARK: - Tests

    func test_equal() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagContentColors(
            color: colors.main.main,
            onColor: colors.main.onMain,
            containerColor: colors.base.background,
            onContainerColor: colors.base.onBackground)

        let colors2 = TagContentColors(
            color: colors.main.main,
            onColor: colors.main.onMain,
            containerColor: colors.base.background,
            onContainerColor: colors.base.onBackground)

        // THEN
        XCTAssertEqual(colors1, colors2)
    }

    func test_not_equal() {
        // GIVEN / WHEN
        let colors = SparkTheme.shared.colors

        let colors1 = TagContentColors(
            color: colors.main.main,
            onColor: colors.main.onMain,
            containerColor: colors.base.background,
            onContainerColor: colors.base.onBackground)

        let colors2 = TagContentColors(
            color: colors.support.support,
            onColor: colors.support.onSupport,
            containerColor: colors.base.background,
            onContainerColor: colors.base.onBackground)

        // THEN
        XCTAssertNotEqual(colors1, colors2)
    }
}

