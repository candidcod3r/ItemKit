//
//  Flexibility.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public enum Flex: Int {
    case min = 0
    case low = 250
    case normal = 500
    case high = 750
    case max = 1000
}

public struct Flexibility {
    public var horizontal: Flex
    public var vertical: Flex

    public init(_ horizontal: Flex, _ vertical: Flex) {
        self.horizontal = horizontal
        self.vertical = vertical
    }

    public static let min = Flexibility(.min, .min)
    public static let low = Flexibility(.low, .low)
    public static let normal = Flexibility(.normal, .normal)
    public static let high = Flexibility(.high, .high)
    public static let max = Flexibility(.max, .max)

}
