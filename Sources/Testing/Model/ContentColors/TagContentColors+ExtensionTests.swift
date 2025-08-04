//
//  TagContentColors+ExtensionTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/07/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTag
import SparkTheming
@_spi(SI_SPI) import SparkThemingTesting

extension TagContentColors {

    // MARK: - Properties

    static func mocked(
        color: any ColorToken = ColorTokenGeneratedMock.random(),
        onColor: any ColorToken = ColorTokenGeneratedMock.random(),
        containerColor: any ColorToken = ColorTokenGeneratedMock.random(),
        onContainerColor: any ColorToken = ColorTokenGeneratedMock.random()
    ) -> Self {
        return .init(
            color: color,
            onColor: onColor,
            containerColor: containerColor,
            onContainerColor: onContainerColor
        )
    }
}
