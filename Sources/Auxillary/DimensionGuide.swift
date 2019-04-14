//
//  DimensionGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum DimensionGuide {
    case fixed(CGFloat)
    case wrapContent
    case percentageParent(CGFloat)
    case fillParent

    func dimension(of contentDimension: CGFloat, within maxDimension: CGFloat) -> CGFloat {
        switch self {
        case .fixed(let value):
            return value
        case .percentageParent(let value):
            let clampedPercentage = clamp(value, within: 0...1)
            return maxDimension * clampedPercentage
        case .wrapContent:
            return contentDimension
        case .fillParent:
            return maxDimension
        }
    }
}
