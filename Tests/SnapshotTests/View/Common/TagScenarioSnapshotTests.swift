//
//  TagScenarioSnapshotTests.swift
//  SparkComponentTagSnapshotTests
//
//  Created by robin.lemaire on 10/10/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

@testable import SparkComponentTag
import UIKit
import SwiftUI
@_spi(SI_SPI) import SparkCommonSnapshotTesting
@_spi(SI_SPI) import SparkCommonTesting

enum TagScenarioSnapshotTests: String, CaseIterable {
    case test1
    case test2
    case test3
    case test4
    case test5
    case test6
    case documentation

    // MARK: - Type Alias

    typealias Constants = ComponentSnapshotTestConstants

    // MARK: - Properties

    var isDocumentation: Bool {
        self == .documentation
    }

    // MARK: - Configurations

    func configuration(isSwiftUIComponent: Bool) -> [TagConfigurationSnapshotTests] {
        switch self {
        case .test1:
            return self.test1()
        case .test2:
            return self.test2()
        case .test3:
            return self.test3()
        case .test4:
            return self.test4()
        case .test5:
            return self.test5()
        case .test6:
            return self.test6()
        case .documentation:
            return self.documentation()
        }
    }

    // MARK: - Scenarios

    /// Test 1
    ///
    /// Description: To test all intents
    ///
    /// Content:
    ///  - intents: **all**
    ///  - size: medium
    ///  - variant: tinted
    ///  - isHighlighted: false
    ///  - content: icon + text
    ///  - mode: **all**
    ///  - size: default
    private func test1() -> [TagConfigurationSnapshotTests] {
        let intents = TagIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                size: .medium,
                variant: .tinted,
                isHighlighted: false,
                content: .label,
                isIcon: true,
                modes: Constants.Modes.all,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 2
    ///
    /// Description: To test all size & isHighlighted
    ///
    /// Content:
    ///  - intent: main
    ///  - size: **all**
    ///  - variant: filled
    ///  - isHighlighted: **all**
    ///  - content: text only
    ///  - mode: **all**
    ///  - size: default
    private func test2() -> [TagConfigurationSnapshotTests] {
        let sizes = TagSize.allCases
        let isHighlighteds = Bool.allCases

        return sizes.flatMap { size in
            isHighlighteds.map { isHighlighted in
                    .init(
                        scenario: self,
                        intent: .main,
                        size: size,
                        variant: .filled,
                        isHighlighted: isHighlighted,
                        content: .label,
                        isIcon: false,
                        modes: Constants.Modes.all,
                        sizes: Constants.Sizes.default
                    )
            }
        }
    }

    /// Test 2
    ///
    /// Description: To test all variants & isHighlighted
    ///
    /// Content:
    ///  - intent: main
    ///  - size: medium
    ///  - variant: **all**
    ///  - isHighlighted: **all**
    ///  - content: text only
    ///  - mode: **all**
    ///  - size: default
    private func test3() -> [TagConfigurationSnapshotTests] {
        let variants = TagVariant.allCases
        let isHighlighteds = Bool.allCases

        return variants.flatMap { variant in
            isHighlighteds.map { isHighlighted in
                    .init(
                        scenario: self,
                        intent: .main,
                        size: .medium,
                        variant: variant,
                        isHighlighted: isHighlighted,
                        content: .label,
                        isIcon: false,
                        modes: Constants.Modes.all,
                        sizes: Constants.Sizes.default
                    )
            }
        }
    }

    /// Test 3
    ///
    /// Description: To test all color for filled variant
    ///
    /// Content:
    ///  - intents: **all**
    ///  - size: medium
    ///  - variant: filled
    ///  - isHighlighted: false
    ///  - content: icon + text
    ///  - mode: default
    ///  - size: default
    private func test4() -> [TagConfigurationSnapshotTests] {
        let intents = TagIntent.allCases

        return intents.map {
            .init(
                scenario: self,
                intent: $0,
                size: .medium,
                variant: .filled,
                isHighlighted: false,
                content: .label,
                isIcon: true,
                modes: Constants.Modes.default,
                sizes: Constants.Sizes.default
            )
        }
    }

    /// Test 4
    ///
    /// Description: To test content resilience
    ///
    /// Content:
    ///  - intent: basic
    ///  - size: medium
    ///  - variant: tinted
    ///  - isHighlighted: false
    ///  - content: **all**
    ///  - mode: default
    ///  - size: default
    private func test5() -> [TagConfigurationSnapshotTests] {
        let contents = TagContentResilience.allCases
        let isIcons = Bool.allCases

        return contents.flatMap { content in
            isIcons.map { isIcon in
                guard isIcon || content.text != nil || content == .other else {
                    return nil
                }

                return .init(
                    scenario: self,
                    intent: .basic,
                    size: .medium,
                    variant: .tinted,
                    isHighlighted: false,
                    content: content,
                    isIcon: isIcon,
                    modes: Constants.Modes.default,
                    sizes: Constants.Sizes.default
                )
            }
            .compactMap { $0 }
        }
    }

    /// Test 6
    ///
    /// Description: To test a11y sizes
    ///
    /// Content:
    ///  - intent: main
    ///  - size: medium
    ///  - variant: tinted
    ///  - isHighlighted: false
    ///  - content: icon + text
    ///  - mode: default
    ///  - size:  all
    private func test6() -> [TagConfigurationSnapshotTests] {
        return [
            .init(
                scenario: self,
                intent: .main,
                size: .medium,
                variant: .tinted,
                isHighlighted: false,
                content: .label,
                isIcon: true,
                modes: Constants.Modes.default,
                sizes: Constants.Sizes.all
            )
        ]
    }

    // MARK: - Documentation

    // Used to generate screenshot for Documentation
    private func documentation() -> [TagConfigurationSnapshotTests] {
        var items: [TagConfigurationSnapshotTests] = []

        // Icon only
        items.append(.init(
            scenario: self,
            content: .withoutLabel,
            isIcon: true,
            documentationName: "with_icon"
        ))

        // Is highlighted
        items.append(.init(
            scenario: self,
            size: .large,
            isHighlighted: true,
            documentationName: "with_is_highlighted"
        ))

        // Label
        items.append(.init(
            scenario: self,
            content: .other,
            isIcon: false,
            documentationName: "with_label"
        ))

        // Label and icon
        items.append(.init(
            scenario: self,
            content: .other,
            isIcon: true,
            documentationName: "with_label_and_icon"
        ))

        // Text
        items.append(.init(
            scenario: self,
            content: .label,
            isIcon: false,
            documentationName: "with_text"
        ))

        // Text and icon
        items.append(.init(
            scenario: self,
            content: .label,
            isIcon: true,
            documentationName: "with_text_and_icon"
        ))

        return items
    }
}
