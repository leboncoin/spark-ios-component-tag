//
//  TagViewModel.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class TagViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = TagBorder()
    @Published private(set) var colors = TagColors()
    @Published private(set) var spacings = TagSpacings()
    @Published private(set) var height: CGFloat?
    @Published private(set) var textFont: Font = .body

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: (any Theme)? {
        didSet {
            guard self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setSpacings()
            self.setTextFont()
        }
    }

    var intent: TagIntent? {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var size: TagSize? {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setHeight()
        }
    }

    var variant: TagVariant? {
        didSet {
            guard oldValue != self.variant, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
        }
    }

    // MARK: - Use Case Properties

    private let getBorderUseCase: TagGetBorderUseCaseable
    private let getColorsUseCase: TagGetColorsUseCaseable
    private let getHeightUseCase: TagGetHeightUseCaseable
    private let getSpacingsUseCase: TagGetSpacingsUseCaseable
    private let getTextFontUseCase: TagGetTextFontUseCaseable

    // MARK: - Initialization

    init(
        getBorderUseCase: TagGetBorderUseCaseable = TagGetBorderUseCase(),
        getColorsUseCase: TagGetColorsUseCaseable = TagGetColorsUseCase(),
        getHeightUseCase: TagGetHeightUseCaseable = TagGetHeightUseCase(),
        getSpacingsUseCase: TagGetSpacingsUseCaseable = TagGetSpacingsUseCase(),
        getTextFontUseCase: TagGetTextFontUseCaseable = TagGetTextFontUseCase()
    ) {
        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getHeightUseCase = getHeightUseCase
        self.getSpacingsUseCase = getSpacingsUseCase
        self.getTextFontUseCase = getTextFontUseCase
    }

    // MARK: - Setup

    func setup(
        theme: Theme,
        intent: TagIntent,
        size: TagSize,
        variant: TagVariant
    ) {
        self.theme = theme
        self.intent = intent
        self.size = size
        self.variant = variant

        self.setBorder()
        self.setColors()
        self.setSpacings()
        self.setHeight()
        self.setTextFont()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        guard let theme, let size, let variant else {
            return
        }

        self.border = self.getBorderUseCase.execute(
            theme: theme,
            size: size,
            variant: variant
        )
    }

    private func setColors() {
        guard let theme, let intent, let variant else {
            return
        }

        self.colors = self.getColorsUseCase.execute(
            theme: theme,
            intent: intent,
            variant: variant
        )
    }

    private func setSpacings() {
        guard let theme else {
            return
        }

        self.spacings = self.getSpacingsUseCase.execute(theme: theme)
    }

    private func setHeight() {
        guard let size else {
            return
        }

        self.height = self.getHeightUseCase.execute(size: size)
    }

    private func setTextFont() {
        guard let theme else {
            return
        }

        self.textFont = self.getTextFontUseCase.execute(theme: theme)
    }
}
