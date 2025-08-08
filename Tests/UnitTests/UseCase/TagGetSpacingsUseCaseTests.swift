//
//  TagGetSpacingsUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

final class TagGetSpacingsUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetSpacingsUseCase()

        // WHEN
        let spacings = useCase.execute(theme: theme)

        // THEN
        XCTAssertEqual(spacings.horizontalPadding, theme.layout.spacing.medium)
        XCTAssertEqual(spacings.horizontalSpacing, theme.layout.spacing.small)
    }
}
