//
//  TagGetBorderUseCase.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 05/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import Foundation
import SparkTheming
import SwiftUI

// sourcery: AutoMockable, AutoMockTest
protocol TagGetBorderUseCaseable {
    // sourcery: theme = "Identical"
    func execute(
        theme: any Theme,
        size: TagSize,
        variant: TagVariant
    ) -> TagBorder
}

final class TagGetBorderUseCase: TagGetBorderUseCaseable {

    // MARK: - Methods

    func execute(
        theme: any Theme,
        size: TagSize,
        variant: TagVariant
    ) -> TagBorder {
        let border = theme.border

        let width = border.width.small

        let radius = switch size {
        case .medium: border.radius.full
        case .large: border.radius.medium
        }

        return .init(width: width, radius: radius)
    }
}
