//
//  TagViewModelTests.swift
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

final class TagViewModelTests: XCTestCase {

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
            otherHeight: true,
            otherTextFont: .body
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

    // MARK: - Setup Tests

    func test_setup_shouldCallAllUseCases() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        // WHEN
        viewModel.setup(stub: stub)

        // THEN
        XCTAssertEqualToExpected(on: stub)

        // **
        // UseCase Calls Count
        TagGetBorderUseCaseableMockTest.XCTAssert(
            stub.getBorderUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenSize: stub.givenSize,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedColors
        )

        TagGetHeightUseCaseableMockTest.XCTAssert(
            stub.getHeightUseCaseMock,
            expectedNumberOfCalls: 1,
            givenSize: stub.givenSize,
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

        viewModel.setup(stub: stub)
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
            givenSize: stub.givenSize,
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: stub.givenVariant,
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

        viewModel.setup(stub: stub)
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
            givenVariant: stub.givenVariant,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    func test_size_shouldUpdate_border_and_height() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        let givenSize = TagSize.medium

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
            givenVariant: stub.givenVariant,
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

        viewModel.setup(stub: stub)
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
            givenSize: stub.givenSize,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedBorder
        )

        TagGetColorsUseCaseableMockTest.XCTAssert(
            stub.getColorsUseCaseMock,
            expectedNumberOfCalls: 1,
            givenTheme: stub.givenTheme,
            givenIntent: stub.givenIntent,
            givenVariant: givenVariant,
            expectedReturnValue: stub.expectedColors
        )
        // **
    }

    func test_allSetter_exceptTheme_withoutChange() {
        // GIVEN
        let stub = Stub()
        let viewModel = stub.viewModel

        viewModel.setup(stub: stub)
        stub.resetMockedData()

        // WHEN
        viewModel.intent = stub.givenIntent
        viewModel.size = stub.givenSize
        viewModel.variant = stub.givenVariant

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

    func test_allSetter_exceptTheme_withoutSetupBefore() {
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
            otherHeight: true,
            otherTextFont: .body
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

private final class Stub: TagViewModelStub {

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
    let expectedTextFont: Font = .subheadline

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
        getTextFontUseCaseMock.executeWithThemeReturnValue = self.expectedTextFont

        let viewModel = TagViewModel(
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

// MARK: - Extension

private extension TagViewModel {

    func setup(stub: Stub) {
        self.setup(
            theme: stub.givenTheme,
            intent: stub.givenIntent,
            size: stub.givenSize,
            variant: stub.givenVariant
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
    otherHeight: Bool = false,
    otherTextFont: Font? = nil
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
        otherHeight ? nil : stub.expectedHeight,
        "Wrong height value"
    )
    XCTAssertEqual(
        viewModel.textFont,
        otherTextFont ?? stub.expectedTextFont,
        "Wrong textFont value"
    )
}
