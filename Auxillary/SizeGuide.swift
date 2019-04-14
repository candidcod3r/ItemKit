//
//  SizeGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum DimensionGuide {
    case fixed(CGFloat)
    case wrapContent
    case percentageParent(CGFloat)
    case fillParent
}

public typealias DimensionRange = ClosedRange<CGFloat>

public struct SizeGuide {
    public static let fullRange = 0...CGFloat.greatestFiniteMagnitude

    public var width: DimensionGuide
    public var widthRange: DimensionRange

    public var height: DimensionGuide
    public var heightRange: DimensionRange

    public init(width: DimensionGuide,
                widthRange: DimensionRange = fullRange,
                height: DimensionGuide,
                heightRange: DimensionRange = fullRange) {
        self.width = width
        self.widthRange = widthRange
        self.height = height
        self.heightRange = heightRange
    }
}
