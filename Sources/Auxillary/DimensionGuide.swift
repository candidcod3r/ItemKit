//
//  DimensionGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum DimensionGuide {
    // fixed value
    case fixed(CGFloat)

    // content fit
    case fit

    // percent of max value
    case percent(CGFloat)

    // use the max value
    case fill

    func dimension(of value: CGFloat, within maxDimension: CGFloat) -> CGFloat {
        switch self {
        case .fixed(let fixedValue):
            return fixedValue
        case .percent(let percentValue):
            let clampedPercentage = clamp(percentValue, within: 0...1)
            return maxDimension * clampedPercentage
        case .fit:
            return value
        case .fill:
            return maxDimension
        }
    }

    var isFit: Bool {
        switch self {
        case .fit:
            return true
        default:
            return false
        }
    }

    var isFill: Bool {
        switch self {
        case .fill:
            return true
        default:
            return false
        }
    }
}
