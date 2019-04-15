//
//  DimensionGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum DimensionGuide {
    case fixed(CGFloat)
    case intrinsic
    case percent(CGFloat)
    case fill

    func dimension(of contentDimension: CGFloat, within maxDimension: CGFloat) -> CGFloat {
        switch self {
        case .fixed(let value):
            return value
        case .percent(let value):
            let clampedPercentage = clamp(value, within: 0...1)
            return maxDimension * clampedPercentage
        case .intrinsic:
            return contentDimension
        case .fill:
            return maxDimension
        }
    }

    var isWrapContent: Bool {
        switch self {
        case .intrinsic:
            return true
        default:
            return false
        }
    }

    var isFillParent: Bool {
        switch self {
        case .fill:
            return true
        default:
            return false
        }
    }

}
