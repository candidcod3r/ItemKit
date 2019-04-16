//
//  Sizer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Sizer {
    public static func fittingSize(within maxSize: CGSize, guide: SizeGuide) -> CGSize {
        let horizontal = fittingDimension(
            within: maxSize.width,
            guide: guide.width,
            clampRange: guide.widthRange)

        let vertical = fittingDimension(
            within: maxSize.height,
            guide: guide.height,
            clampRange: guide.heightRange)

        return CGSize(width: horizontal, height: vertical)
    }

    public static func fittingDimension(within maxDimension: CGFloat, guide: DimensionGuide, clampRange: DimensionRange) -> CGFloat {
        let unclampedDimension = guide.fittingDimension(within: maxDimension)
        let dimension = clamp(unclampedDimension, within: clampRange)
        return dimension
    }
}
