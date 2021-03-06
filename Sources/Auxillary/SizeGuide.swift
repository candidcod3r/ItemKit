//
//  SizeGuide.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public typealias DimensionRange = ClosedRange<CGFloat>

public struct SizeGuide {
    public static let fill = SizeGuide(width: .fill, height: .fill)
    public static let fillWidth = SizeGuide(width: .fill)
    public static let fillHeight = SizeGuide(height: .fill)

    public static let fullRange = 0...CGFloat.greatestFiniteMagnitude

    public var width: DimensionGuide
    public var widthRange: DimensionRange

    public var height: DimensionGuide
    public var heightRange: DimensionRange

    public init(width: DimensionGuide = .fit,
                widthRange: DimensionRange = fullRange,
                height: DimensionGuide = .fit,
                heightRange: DimensionRange = fullRange) {
        self.width = width
        self.widthRange = widthRange
        self.height = height
        self.heightRange = heightRange
    }

    public var minSize: CGSize {
        return CGSize(width: widthRange.lowerBound, height: heightRange.lowerBound)
    }

    public var maxSize: CGSize {
        return CGSize(width: widthRange.upperBound, height: heightRange.upperBound)
    }
}
