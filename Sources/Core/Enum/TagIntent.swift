//
//  TagIntent.swift
//  SparkComponentTag
//
//  Created by robin.lemaire on 27/03/2023.
//  Copyright © 2023 Leboncoin. All rights reserved.
//

/// The intent of the tag.
///
/// The default value is **.main**.
public enum TagIntent: CaseIterable {
    case alert
    case danger
    case info
    case neutral
    case main
    case support
    case success
    case surface
    case accent
    case basic

    // MARK: - Properties

    public static let `default`: Self = .main
}
