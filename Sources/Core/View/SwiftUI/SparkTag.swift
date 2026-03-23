//
//  SparkTag.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 04/08/2025.
//  Copyright © 2025 Leboncoin. All rights reserved.
//

import SwiftUI
@_spi(SI_SPI) import SparkCommon
import SparkTheming

/// A Spark Tag is used to label content and help users quickly recognize info
/// about them: Categories, Status...
/// Can be applied with different colors and designs that are associated
/// with a content due to its characteristics: new content, unvisited content,
/// featured content...
///
/// Users can’t interact with Tag except for accessibility.
///
/// There is some possibilities to init the component :
/// - With a **localized string key** or a **string**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             "My tag",
///             theme: self.theme
///         )
///     }
/// }     
/// ```
/// ![Tag rendering with a localized text.](component_with_text.png)
///
/// - With a **label**:
///
/// **Use it carefully with Spark font and color !**
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             theme: self.theme,
///             label: {
///                 VStack {
///                     Text("Hello")
///                     Text("World")
///                 }
///             }
///         )
///     }
/// }
/// ```
/// ![Tag rendering with a label.](component_with_label.png)
///
/// - With an **icon**:
///
/// **You must set the _accessibilityLabel_ and a _sparkAccessibilityLargeContentText_**.
///
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             theme: self.theme,
///             icon: .init(systemName: "checkmark")
///         )
///         .accessibilityLabel("My Tag")
///         .sparkAccessibilityLargeContentText("My Tag")
///     }
/// }
/// ```
/// ![Tag rendering with an icon.](component_with_icon.png)
///
/// - With a **localized string key** or a **string** and an **icon**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             "My tag",
///             icon: .init(systemName: "checkmark"),
///             theme: self.theme
///         )
///     }
/// }
/// ```
/// ![Tag rendering with a localized text and icon.](component_with_text_and_icon.png)
///
/// - With a **localized string key** or a **string** and an **icon**:
/// ```swift
/// struct MyView: View {
///     let theme: SparkTheming.Theme = MyTheme()
///
///     var body: some View {
///         SparkTag(
///             theme: self.theme,
///             icon: .init(systemName: "checkmark"),
///             label: {
///                 VStack {
///                     Text("Hello")
///                     Text("World")
///                 }
///             }
///         )
///     }
/// }
/// ```
/// ![Tag rendering with a label and icon.](component_with_label_and_icon.png)
///
/// Some environment values are used by the ``SparkTag``:
/// - Intent:
/// ```swift
/// SparkTag(
///     "My tag",
///     theme: self.theme
/// )
/// .sparkTagIntent(.success)
/// ```
/// 
/// - Size:
/// ```swift
/// SparkTag(
///     "My tag",
///     theme: self.theme
/// )
/// .sparkTagSize(.large)
/// ```
///
/// - Variant:
/// ```swift
/// SparkTag(
///     "My tag",
///     theme: self.theme
/// )
/// .sparkTagVariant(.tinted)
/// ```
///
/// - Is Highlighted:
/// ```swift
/// SparkTag(
///     "My tag",
///     theme: self.theme
/// )
/// .sparkTagIsHighlighted(true)
/// ```
/// ![Tag rendering with when us highlighted is true.](component_with_is_highlighted.png)
///
/// - Accessibility Large Content Text:
/// ```swift
/// SparkTag(
///     theme: self.theme,
///     icon: .init(systemName: "checkmark")
/// )
/// .sparkAccessibilityLargeContentText("The purpose of my tag")
/// ```
public struct SparkTag<Label>: View where Label: View {

    // MARK: - Type Alias

    private typealias AccessibilityIdentifier = TagAccessibilityIdentifier

    // MARK: - Private Properties

    private let theme: any Theme
    private let label: () -> Label
    private let icon: Image?

    @StateObject private var viewModel = TagViewModel()

    @Environment(\.tagIntent) private var intent
    @Environment(\.tagSize) private var size
    @Environment(\.tagVariant) private var variant
    @Environment(\.tagIsHighlighted) private var isHighlighted
    @Environment(\.accessibilityLargeContentText) private var largeContentText

    // MARK: - Label Initialization

    /// Creates a Spark tag that generates its label from a localized string key.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text.](component_with_text.png)
    public init(
        _ textKey: LocalizedStringKey,
        theme: any Theme
    ) where Label == Text {
        self.theme = theme
        self.label = { Text(textKey) }
        self.icon = nil
    }

    /// Creates a Spark tag that generates its label from a text.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text.](component_with_text.png)
    public init(
        _ text: String,
        theme: any Theme
    ) where Label == Text {
        self.theme = theme
        self.label = { Text(text) }
        self.icon = nil
    }

    /// Creates a Spark tag that generates its label from a custom label.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - label: A view that describes the purpose of the label.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             label: {
    ///                 VStack {
    ///                     Text("Hello")
    ///                     Text("World")
    ///                 }
    ///             }
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a label.](component_with_label.png)
    public init(
        theme: any Theme,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.theme = theme
        self.label = label
        self.icon = nil
    }
    // MARK: - Icon Initialization

    /// Creates a Spark tag that generates its label from an icon.
    ///
    /// Note : You must provide an *accessibilityLabel* !
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             icon: .init(systemName: "checkmark")
    ///         )
    ///         .accessibilityLabel("My Tag")
    ///         .sparkAccessibilityLargeContentText("My Tag")
    ///     }
    /// ```
    ///
    /// ![Tag rendering with an icon.](component_with_icon.png)
    public init(
        theme: any Theme,
        icon: Image
    ) where Label == EmptyView {
        self.theme = theme
        self.label = { EmptyView() }
        self.icon = icon
    }

    // MARK: - Label + Icon Initialization

    /// Creates a Spark tag that generates its label from a localized string key
    /// and an icon.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's localized text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             icon: .init(systemName: "checkmark"),
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a localized text and icon.](component_with_text_and_icon.png)
    public init(
        _ textKey: LocalizedStringKey,
        icon: Image,
        theme: any Theme
    ) where Label == Text {
        self.theme = theme
        self.icon = icon
        self.label = { Text(textKey) }
    }

    /// Creates a Spark tag that generates its label from a text and an icon.
    ///
    /// - Parameters:
    ///   - textKey: The key for the tag's text, that describes
    ///     the purpose of the tag.
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             "My tag",
    ///             icon: .init(systemName: "checkmark"),
    ///             theme: self.theme
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a text and icon.](component_with_text_and_icon.png)
    public init(
        _ text: String,
        icon: Image,
        theme: any Theme
    ) where Label == Text {
        self.theme = theme
        self.icon = icon
        self.label = { Text(text) }
    }

    /// Creates a Spark tag that generates its label from a custom label and an icon.
    ///
    /// - Parameters:
    ///   - theme: The current theme.
    ///   - icon: The icon that describe the purpose of the tag.
    ///   - label: A view that describes the purpose of the label.
    ///
    /// Implementation example :
    /// ```swift
    /// struct MyView: View {
    ///     let theme: SparkTheming.Theme = MyTheme()
    ///
    ///     var body: some View {
    ///         SparkTag(
    ///             theme: self.theme,
    ///             icon: .init(systemName: "checkmark"),
    ///             label: {
    ///                 VStack {
    ///                     Text("Hello")
    ///                     Text("World")
    ///                 }
    ///             }
    ///         )
    ///     }
    /// ```
    ///
    /// ![Tag rendering with a label and icon.](component_with_label_and_icon.png)
    public init(
        theme: any Theme,
        icon: Image,
        @ViewBuilder label: @escaping () -> Label
    ) {
        self.theme = theme
        self.icon = icon
        self.label = label
    }

    // MARK: - View

    public var body: some View {
        SparkHStack(spacing: self.viewModel.spacings.horizontalSpacing) {
            // Optional icon image
            self.icon?
                .resizable()
                .scaledToFit()
                .sparkFrame(
                    height: TagConstants.iconSize,
                    relativeTo: .body
                )
                .foregroundStyle(self.viewModel.colors.foregroundColor)
                .accessibilityIdentifier(AccessibilityIdentifier.iconImage)
                .accessibilityHidden(true)

            // Optional Text
            self.label()
                .font(self.viewModel.textFont)
                .foregroundStyle(self.viewModel.colors.foregroundColor)
                .lineLimit(1)
                .truncationMode(.tail)
                .accessibilityIdentifier(AccessibilityIdentifier.text)
        }
        .sparkPadding(.init(
            horizontal: self.viewModel.spacings.horizontalPadding
        ))
        .sparkFrame(
            height: self.viewModel.height,
            relativeTo: .title3
        )
        .background(self.viewModel.colors.backgroundColor.color)
        .sparkBorder(
            width: self.viewModel.border.width,
            radius: self.viewModel.border.radius,
            isHighlighted: self.isHighlighted,
            colorToken: self.viewModel.colors.borderColor
        )
        .accessibilityElement(children: .combine)
        .accessibilityShowsLargeContentViewer() {
            self.icon

            if let largeContentText {
                Text(largeContentText)
            } else {
                self.label()
            }
        }
        .dynamicTypeSize(...DynamicTypeSize.accessibility3)
        .onAppear() {
            self.viewModel.setup(
                theme: self.theme,
                intent: self.intent,
                size: self.size,
                variant: self.variant
            )
        }
        .onChange(of: self.intent) { intent in
            self.viewModel.intent = intent
        }
        .onChange(of: self.size) { size in
            self.viewModel.size = size
        }
        .onChange(of: self.variant) { variant in
            self.viewModel.variant = variant
        }
    }
}
