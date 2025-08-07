//
//  TagGetTextFontUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

final class TagGetTextFontUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_executeUI_returnsUIFontFromTheme() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetTextFontUseCase()

        // WHEN
        let result = useCase.executeUI(theme: theme)

        // THEN
        XCTAssertEqual(result, theme.typography.captionHighlight.uiFont)
    }

    func test_execute_returnsFontFromTheme() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetTextFontUseCase()

        // WHEN
        let result = useCase.execute(theme: theme)

        // THEN
        XCTAssertEqual(result, theme.typography.captionHighlight.font)
    }
}
