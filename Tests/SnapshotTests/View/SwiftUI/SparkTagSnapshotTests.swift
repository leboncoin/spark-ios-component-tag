//
//  SparkTagSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 07/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import SparkComponentTag
import SparkTheming
import SparkTheme
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting

final class SparkTagSnapshotTests: SwiftUIComponentSnapshotTestCase {

    // MARK: - Properties

    private let theme: any Theme = SparkTheme.shared

    // MARK: - Tests

    func test() {
        let forDocumentation = false

        let scenarios = TagScenarioSnapshotTests.allCases(forDocumentation: forDocumentation)

        for scenario in scenarios {
            let configurations = scenario.configuration(isSwiftUIComponent: true)
            for configuration in configurations {
                let view = self.component(configuration: configuration)
                    .sparkTagIntent(configuration.intent)
                    .sparkTagSize(configuration.size)
                    .sparkTagVariant(configuration.variant)
                    .sparkTagIsHighlighted(configuration.isHighlighted)
                    .sparkFrame(width: configuration.width)
                    .padding(4)
                    .fixedSize()
                    .padding(10)
                    .background(.background)

                self.assertSnapshot(
                    matching: view,
                    modes: configuration.modes,
                    sizes: configuration.sizes,
                    testName: configuration.testName()
                )
            }
        }
    }

    @ViewBuilder
    func component(configuration: TagConfigurationSnapshotTests) -> some View {
        if configuration.isIcon, configuration.content == .other {
            SparkTag(
                theme: self.theme,
                icon: .mock,
                label: {
                    Group {
                        Text("My Tag ") +
                        Text("is amazing")
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if !configuration.isIcon, configuration.content == .other {
            SparkTag(
                theme: self.theme,
                label: {
                    Group {
                        Text("My Tag ") +
                        Text("is amazing")
                            .foregroundColor(.blue)
                            .italic()
                    }
                }
            )

        } else if configuration.isIcon, let text = configuration.content.text {
            SparkTag(
                text,
                icon: .mock,
                theme: self.theme
            )

        } else if configuration.isIcon {
            SparkTag(
                theme: self.theme,
                icon: .mock
            )

        } else {
            SparkTag(
                configuration.content.text ?? "Unknow",
                theme: self.theme
            )
        }
    }
}

private extension Image {
    static let mock = Image(systemName: "person.2.circle.fill")
}
