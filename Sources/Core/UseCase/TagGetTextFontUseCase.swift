//
//  TagGetTextFontUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SparkTheming
import SwiftUI
import UIKit

// sourcery: AutoMockable, AutoMockTest
protocol TagGetTextFontUseCaseable {
    // sourcery: theme = "Identical"
    func execute(theme: Theme) -> Font
    // sourcery: theme = "Identical"
    func executeUI(theme: Theme) -> UIFont
}

final class TagGetTextFontUseCase: TagGetTextFontUseCaseable {

    // MARK: - Methods

    func execute(theme: Theme) -> Font {
        return self.execute(theme: theme).font
    }

    func executeUI(theme: Theme) -> UIFont {
        return self.execute(theme: theme).uiFont
    }

    // MARK: - Methods

    private func execute(theme: Theme) -> any TypographyFontToken {
        return theme.typography.captionHighlight
    }
}
