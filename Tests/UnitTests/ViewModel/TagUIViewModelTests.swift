//
//  TagUIViewModelTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
@testable import SparkComponentTag
@_spi(SI_SPI) @testable import SparkComponentTagTesting
@_spi(SI_SPI) import SparkCommon
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting
import SwiftUI

final class TagUIViewModelTests: XCTestCase {

    // MARK: - Initialization Test

    func test_initialization_shouldUseDefaultValues() {
        // GIVEN / WHEN
        let stub = Stub()

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: .init(),
            otherColors: .init(),
            otherSpacings: .init(),
            otherHeight: 0,
            otherTextFont: .systemFont(ofSize: 14)
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )
    }

    // MARK: - Load Tests

    func test_load_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.load()

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        TagGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: .default,
            givenVariant: .default,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: .default,
            givenVariant: .default,
            expectedReturnValue: stub.expectedColors
        )

        TagGetHeightUseCaseableMockTest.XCTAssert(
            stub.getHeightUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: .default,
            expectedReturnValue: stub.expectedHeight
        )

        TagGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        TagGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            expectedReturnValue: stub.expectedTextFont
        )
        // **
    }

    // MARK: - Setter

    func test_themeChanged_shouldUpdateAllProperties_exceptHeight() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenTheme = ThemeGeneratedMock.mocked()

        // WHEN
        viewModel.theme = givenTheme

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getHeight: true
        )

        TagGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenSize: .default,
            givenVariant: .default,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: .default,
            givenVariant: .default,
            expectedReturnValue: stub.expectedColors
        )

        TagGetSpacingsUseCaseableMockTest.XCTAssert(
            stub.getSpacingsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedSpacings
        )

        TagGetTextFontUseCaseableMockTest.XCTAssert(
            stub.getTextFontUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            expectedReturnValue: stub.expectedTextFont
        )
        // **
    }

    func test_intent_shouldUpdate_Colors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenIntent = TagIntent.success

        // WHEN
        viewModel.intent = givenIntent

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorder: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: givenIntent,
            givenVariant: .default,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    func test_size_shouldUpdate_border_and_height() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenSize = TagSize.large

        // WHEN
        viewModel.size = givenSize

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getColors: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: givenSize,
            givenVariant: .default,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetHeightUseCaseableMockTest.XCTAssert(
            stub.getHeightUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: givenSize,
            expectedReturnValue: stub.expectedHeight
        )
        // **
    }

    func test_variant_shouldUpdate_border_and_colors() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        let givenVariant = TagVariant.outlined

        // WHEN
        viewModel.variant = givenVariant

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )

        TagGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: .default,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: .default,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    func test_allSetter_exceptTheme_withoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.load()
        stub.resetMockedData()

        // WHEN
        viewModel.intent = .default
        viewModel.size = .default
        viewModel.variant = .default

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )
    }

    func test_allSetter_exceptTheme_withoutLoadBefore() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.intent = .accent
        viewModel.size = .medium
        viewModel.variant = .filled

        // THEN
        XCTAssertEqualToExpected(
            on: stub,
            otherBorder: .init(),
            otherColors: .init(),
            otherSpacings: .init(),
            otherHeight: 0,
            otherTextFont: .systemFont(ofSize: 14)
        )

        // UseCase Calls Count
        XCTAssertNotCalled(
            on: stub,
            getBorder: true,
            getColors: true,
            getHeight: true,
            getSpacings: true,
            getTextFont: true
        )
    }
}

// MARK: - Stub

private final class Stub: TagUIViewModelStub {

    // MARK: - Given Properties

    let givenTheme = ThemeGeneratedMock.mocked()
    let givenIntent = TagIntent.danger
    let givenSize = TagSize.large
    let givenVariant = TagVariant.tinted

    // MARK: - Expected Properties

    let expectedBorder = TagBorder()
    let expectedColors = TagColors()
    let expectedSpacings = TagSpacings()
    let expectedHeight: CGFloat = 10
    let expectedTextFont: UIFont = .italicSystemFont(ofSize: 10)

    // MARK: - Initialization

    init() {
        let getBorderUseCaseMock = TagGetBorderUseCaseableGeneratedMock()
        getBorderUseCaseMock.executeWithThemeAndSizeAndVariantReturnValue = self.expectedBorder

        let getColorsUseCaseMock = TagGetColorsUseCaseableGeneratedMock()
        getColorsUseCaseMock.executeWithThemeAndIntentAndVariantReturnValue = self.expectedColors

        let getHeightUseCaseMock = TagGetHeightUseCaseableGeneratedMock()
        getHeightUseCaseMock.executeWithSizeReturnValue = self.expectedHeight

        let getSpacingsUseCaseMock = TagGetSpacingsUseCaseableGeneratedMock()
        getSpacingsUseCaseMock.executeWithThemeReturnValue = self.expectedSpacings

        let getTextFontUseCaseMock = TagGetTextFontUseCaseableGeneratedMock()
        getTextFontUseCaseMock.executeUIWithThemeReturnValue = self.expectedTextFont

        let viewModel = TagUIViewModel(
            theme: self.givenTheme,
            getBorderUseCase: getBorderUseCaseMock,
            getColorsUseCase: getColorsUseCaseMock,
            getHeightUseCase: getHeightUseCaseMock,
            getSpacingsUseCase: getSpacingsUseCaseMock,
            getTextFontUseCase: getTextFontUseCaseMock
        )

        super.init(
            viewModel: viewModel,
            getBorderUseCaseMock: getBorderUseCaseMock,
            getColorsUseCaseMock: getColorsUseCaseMock,
            getHeightUseCaseMock: getHeightUseCaseMock,
            getSpacingsUseCaseMock: getSpacingsUseCaseMock,
            getTextFontUseCaseMock: getTextFontUseCaseMock
        )
    }
}

// MARK: - XCT

private func XCTAssertNotCalled(
    on stub: Stub,
    getBorder getBorderNotCalled: Bool = false,
    getColors getColorsNotCalled: Bool = false,
    getHeight getHeightNotCalled: Bool = false,
    getSpacings getSpacingsNotCalled: Bool = false,
    getTextFont getTextFontNotCalled: Bool = false
) {
    if getBorderNotCalled {
        TagGetBorderUseCaseableMockTest.XCTCallsCount(
            stub.getBorderUseCaseMock,
            executeWithThemeAndSizeAndVariantNumberOfCalls: 0
        )
    }

    if getColorsNotCalled {
        TagGetColorsUseCaseableMockTest.XCTCallsCount(
            stub.getColorsUseCaseMock,
            executeWithThemeAndIntentAndVariantNumberOfCalls: 0
        )
    }

    if getHeightNotCalled {
        TagGetHeightUseCaseableMockTest.XCTCallsCount(
            stub.getHeightUseCaseMock,
            executeWithSizeNumberOfCalls: 0
        )
    }

    if getSpacingsNotCalled {
        TagGetSpacingsUseCaseableMockTest.XCTCallsCount(
            stub.getSpacingsUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
    }

    if getTextFontNotCalled {
        TagGetTextFontUseCaseableMockTest.XCTCallsCount(
            stub.getTextFontUseCaseMock,
            executeWithThemeNumberOfCalls: 0
        )
    }
}

private func XCTAssertEqualToExpected(
    on stub: Stub,
    otherBorder: TagBorder? = nil,
    otherColors: TagColors? = nil,
    otherSpacings: TagSpacings? = nil,
    otherHeight: CGFloat? = nil,
    otherTextFont: UIFont? = nil
) {
    let viewModel = stub.viewModel

    XCTAssertEqual(
        viewModel.border,
        otherBorder ?? stub.expectedBorder,
        "Wrong border value"
    )
    XCTAssertEqual(
        viewModel.colors,
        otherColors ?? stub.expectedColors,
        "Wrong colors value"
    )
    XCTAssertEqual(
        viewModel.spacings,
        otherSpacings ?? stub.expectedSpacings,
        "Wrong spacings value"
    )
    XCTAssertEqual(
        viewModel.height,
        otherHeight ?? stub.expectedHeight,
        "Wrong height value"
    )
    XCTAssertEqual(
        viewModel.textFont,
        otherTextFont ?? stub.expectedTextFont,
        "Wrong textFont value"
    )
}
