//
//  Sizer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Sizer {

    public static func size(with contentSize: CGSize,
                            guide: SizeGuide,
                            within maxSize: CGSize) -> CGSize {
        let horizontal = dimension(
            with: contentSize.width,
            guide: guide.width,
            clampRange: guide.widthRange,
            within: maxSize.width)

        let vertical = dimension(
            with: contentSize.height,
            guide: guide.height,
            clampRange: guide.heightRange,
            within: maxSize.height)

        return CGSize(width: horizontal, height: vertical)
    }

    public static func dimension(with contentDimension: CGFloat,
                                 guide: DimensionGuide,
                                 clampRange: DimensionRange,
                                 within maxDimension: CGFloat) -> CGFloat {
        let unclampedDimension = guide.dimension(of: contentDimension, within: maxDimension)
        let dimension = clamp(unclampedDimension, within: clampRange)

        return dimension
    }

}
