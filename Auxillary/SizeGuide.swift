//
//  SizeGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum Dimension {
    case fixed(CGFloat)
    case wrapContent
    case percentageParent(CGFloat)
    case fillParent
}

public struct SizeGuide {
    public typealias DimensionRange = ClosedRange<CGFloat>

    public static let fullRange = 0...CGFloat.greatestFiniteMagnitude

    public var width: Dimension
    public var widthRange: DimensionRange

    public var height: Dimension
    public var heightRange: DimensionRange

    public init(width: Dimension,
                widthRange: DimensionRange = fullRange,
                height: Dimension,
                heightRange: DimensionRange = fullRange) {
        self.width = width
        self.widthRange = widthRange
        self.height = height
        self.heightRange = heightRange
    }
}
