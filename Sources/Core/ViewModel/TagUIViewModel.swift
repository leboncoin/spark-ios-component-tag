//
//  TagUIViewModel.swift
//  SparkComponentSelectionControls
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// ViewModel only used by **SwiftUI** View.
// sourcery: AutoPublisherTest, AutoViewModelStub
final internal class TagUIViewModel: ObservableObject {

    // MARK: - Published Properties

    @Published private(set) var border = TagBorder()
    @Published private(set) var colors = TagColors()
    @Published private(set) var spacings = TagSpacings()
    @Published private(set) var height: CGFloat = 0
    @Published private(set) var textFont: UIFont = .systemFont(ofSize: 14)

    // MARK: - Properties

    private var alreadyUpdateAll = false

    var theme: any Theme {
        didSet {
            guard self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setColors()
            self.setSpacings()
            self.setTextFont()
        }
    }

    var intent: TagIntent = .default {
        didSet {
            guard oldValue != self.intent, self.alreadyUpdateAll else { return }

            self.setColors()
        }
    }

    var size: TagSize = .default {
        didSet {
            guard oldValue != self.size, self.alreadyUpdateAll else { return }

            self.setBorder()
            self.setHeight()
        }
    }

    var variant: TagVariant = .default {
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
        theme: any Theme,
        getBorderUseCase: TagGetBorderUseCaseable = TagGetBorderUseCase(),
        getColorsUseCase: TagGetColorsUseCaseable = TagGetColorsUseCase(),
        getHeightUseCase: TagGetHeightUseCaseable = TagGetHeightUseCase(),
        getSpacingsUseCase: TagGetSpacingsUseCaseable = TagGetSpacingsUseCase(),
        getTextFontUseCase: TagGetTextFontUseCaseable = TagGetTextFontUseCase()
    ) {
        self.theme = theme

        self.getBorderUseCase = getBorderUseCase
        self.getColorsUseCase = getColorsUseCase
        self.getHeightUseCase = getHeightUseCase
        self.getSpacingsUseCase = getSpacingsUseCase
        self.getTextFontUseCase = getTextFontUseCase
    }

    // MARK: - Load

    func load() {
        self.setBorder()
        self.setColors()
        self.setSpacings()
        self.setHeight()
        self.setTextFont()

        self.alreadyUpdateAll = true
    }

    // MARK: - Private Setter

    private func setBorder() {
        self.border = self.getBorderUseCase.execute(
            theme: self.theme,
            size: self.size,
            variant: self.variant
        )
    }

    private func setColors() {
        self.colors = self.getColorsUseCase.execute(
            theme: self.theme,
            intent: self.intent,
            variant: self.variant
        )
    }

    private func setSpacings() {
        self.spacings = self.getSpacingsUseCase.execute(theme: self.theme)
    }

    private func setHeight() {
        self.height = self.getHeightUseCase.execute(size: self.size)
    }

    private func setTextFont() {
        self.textFont = self.getTextFontUseCase.executeUI(theme: self.theme)
    }
}
