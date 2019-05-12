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

    public static func fittingSize(within maxSize: CGSize, using guide: SizeGuide) -> CGSize {
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

    /**
     Return the size based on the content size and fitting size
     */
    public static func size(from contentSize: CGSize, fittingSize: CGSize, using guide: SizeGuide) -> CGSize {
        let horizontal = dimension(
            from: contentSize.width,
            fittingDimension: fittingSize.width,
            using: guide.width)

        let vertical = dimension(
            from: contentSize.height,
            fittingDimension: fittingSize.height,
            using: guide.height)

        return CGSize(width: horizontal, height: vertical)
    }

    /**
     Return the dimension based on the content dimension and fitting dimension
     */
    public static func dimension(from contentDimension: CGFloat,
                                 fittingDimension: CGFloat,
                                 using guide: DimensionGuide) -> CGFloat {
        switch guide {
        case .fixed(_),
             .percent(_):
            return fittingDimension
        case .fit,
            .fill:
            return contentDimension
        }
    }

}
