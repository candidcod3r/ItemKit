//
//  Flexibility.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum Flex: Int, Comparable {
    case min = 0
    case low = 250
    case normal = 500
    case high = 750
    case max = 1000

    public static func < (lhs: Flex, rhs: Flex) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
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

    func flex(for axis: Axis) -> Flex {
        switch axis {
        case .horizontal:
            return horizontal
        case .vertical:
            return vertical
        }
    }

    func compare(to other: Flexibility, for axis: Axis) -> ComparisonResult {
        let flex = self.value(along: axis)
        let otherFlex = other.value(along: axis)

        if (flex < otherFlex) {
            return .orderedAscending
        } else if (flex > otherFlex) {
            return .orderedDescending
        } else {
            return .orderedSame
        }
    }
}
