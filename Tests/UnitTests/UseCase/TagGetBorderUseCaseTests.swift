//
//  TagGetBorderUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

final class TagGetBorderUseCaseTests: XCTestCase {

    // MARK: - Properties

    private var useCase = TagGetBorderUseCase()
    private var theme = ThemeGeneratedMock.mocked()

    // MARK: - Filled Variant Tests

    func test_execute_with_medium_size_filled_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .medium,
            variant: .filled
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.full)
    }

    func test_execute_with_large_size_filled_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .large,
            variant: .filled
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.medium)
    }

    // MARK: - Outlined Variant Tests

    func test_execute_with_medium_size_outlined_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .medium,
            variant: .outlined
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.full)
    }

    func test_execute_with_large_size_outlined_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .large,
            variant: .outlined
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.medium)
    }

    // MARK: - Tinted Variant Tests

    func test_execute_with_medium_size_tinted_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .medium,
            variant: .tinted
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.full)
    }

    func test_execute_with_large_size_tinted_variant() {
        let border = self.useCase.execute(
            theme: self.theme,
            size: .large,
            variant: .tinted
        )

        XCTAssertEqual(border.width, self.theme.border.width.small)
        XCTAssertEqual(border.radius, self.theme.border.radius.medium)
    }
}
