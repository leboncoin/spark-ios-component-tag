//
//  TagColors.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 28/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@_spi(SI_SPI) import SparkTheming

struct TagColors {

    // MARK: - Properties

    var backgroundColor: any ColorToken = ColorTokenClear()
    var borderColor: any ColorToken = ColorTokenClear()
    var foregroundColor: any ColorToken = ColorTokenClear()
}

// MARK: Hashable & Equatable

extension TagColors: Hashable, Equatable {

    func hash(into hasher: inout Hasher) {
        hasher.combine(self.backgroundColor)
        hasher.combine(self.borderColor)
        hasher.combine(self.foregroundColor)
    }

    static func == (lhs: TagColors, rhs: TagColors) -> Bool {
        return lhs.backgroundColor.equals(rhs.backgroundColor) &&
        lhs.borderColor.equals(rhs.borderColor) &&
        lhs.foregroundColor.equals(rhs.foregroundColor)
    }
}
