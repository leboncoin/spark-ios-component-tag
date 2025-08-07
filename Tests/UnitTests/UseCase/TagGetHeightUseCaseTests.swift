//
//  TagGetHeightUseCaseTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 06/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkThemingTesting

final class TagGetHeightUseCaseTests: XCTestCase {

    // MARK: - Tests

    func test_execute_with_medium_size() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetHeightUseCase()

        // WHEN
        let height = useCase.execute(size: .medium)

        // THEN
        XCTAssertEqual(height, 20)
    }

    func test_execute_with_large_size() {
        // GIVEN
        let theme = ThemeGeneratedMock.mocked()
        let useCase = TagGetHeightUseCase()

        // WHEN
        let height = useCase.execute(size: .large)

        // THEN
        XCTAssertEqual(height, 24)
    }
}
