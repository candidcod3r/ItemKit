//
//  Sizer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Sizer {
    public static func size(of fittingSize: CGSize, within maxSize: CGSize, using guide: SizeGuide) -> CGSize {
        let horizontal = dimension(
            fittingDimension: fittingSize.width,
            within: maxSize.width,
            using: guide.width,
            clampRange: guide.widthRange)

        let vertical = dimension(
            fittingDimension: fittingSize.height,
            within: maxSize.height,
            using: guide.height,
            clampRange: guide.heightRange)

        return CGSize(width: horizontal, height: vertical)
    }

    public static func maxFittingSize(within maxSize: CGSize, using guide: SizeGuide) -> CGSize {
        let horizontal = dimension(
            fittingDimension: maxSize.width,
            within: maxSize.width,
            using: guide.width,
            clampRange: guide.widthRange)

        let vertical = dimension(
            fittingDimension: maxSize.height,
            within: maxSize.height,
            using: guide.height,
            clampRange: guide.heightRange)

        return CGSize(width: horizontal, height: vertical)
    }

    public static func dimension(fittingDimension: CGFloat,
                                 within maxDimension: CGFloat,
                                 using guide: DimensionGuide,
                                 clampRange: DimensionRange) -> CGFloat {
        let unclampedDimension = guide.dimension(of: fittingDimension, within: maxDimension)
        let dimension = clamp(unclampedDimension, within: clampRange)
        return dimension
    }
}
