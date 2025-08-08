//
//  TagConfigurationSnapshotTests.swift
//  SparkComponentTagTests
//
//  Created by robin.lemaire on 05/05/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

import UIKit
@testable import SparkComponentTag
@_spi(SI_SPI) import SparkCommon
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

struct TagConfigurationSnapshotTests {

    // MARK: - Properties

    let scenario: TagScenarioSnapshotTests

    let intent: TagIntent
    let size: TagSize
    let variant: TagVariant
    let isHighlighted: Bool
    let content: TagContentResilience
    let isIcon: Bool
    var width: CGFloat? {
        return self.content == .longLabel ? 100 : nil
    }
    let modes: [ComponentSnapshotTestMode]
    let sizes: [UIContentSizeCategory]

    // MARK: - Getter

    func testName() -> String {
        return [
            "\(self.scenario.rawValue)",
            "\(self.intent)",
            "\(self.size)",
            "\(self.variant)",
            self.isHighlighted ? "isHighlighted" : nil,
            "\(self.content.rawValue)",
            self.isIcon ? "isIcon" : nil,
        ]
            .compactMap { $0 }
            .joined(separator: "-")
    }
}

// MARK: - Enum

enum TagContentResilience: String, CaseIterable {
    case withoutLabel
    case label
    case longLabel
    case other

    var text: String? {
        switch self {
        case .withoutLabel: nil
        case .label: "My Text"
        case .longLabel: "Very very long long tag"
        case .other: nil
        }
    }
}
