//
//  Framer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct Framer {
    typealias OffsetDimension = (offset: CGFloat, dimension: CGFloat)

    public static func frame(with contentSize: CGSize,
                             guide: SizeGuide,
                             alignment: Alignment,
                             within frame: CGRect) -> CGRect {
        let horizontal = offsetDimension(
            with: contentSize.width,
            guide: guide.width,
            clampRange: guide.widthRange,
            alignment: alignment.horizontal,
            within: frame.width)

        let vertical = offsetDimension(
            with: contentSize.height,
            guide: guide.height,
            clampRange: guide.heightRange,
            alignment: alignment.vertical,
            within: frame.height)

        return CGRect(
            x: frame.origin.x + horizontal.offset,
            y: frame.origin.y + vertical.offset,
            width: horizontal.dimension,
            height: vertical.dimension)
    }

    public static func offsetDimension(with contentDimension: CGFloat,
                                       guide: DimensionGuide,
                                       clampRange: DimensionRange,
                                       alignment: HorizontalAlignment,
                                       within maxDimension: CGFloat) -> OffsetDimension {
        let unclampedDimension = guide.dimension(of: contentDimension, within: maxDimension)
        let dimension = clamp(unclampedDimension, within: clampRange)
        let offset = alignment.offet(of: dimension, within: maxDimension)

        return (offset, dimension)
    }

    public static func offsetDimension(with contentDimension: CGFloat,
                                       guide: DimensionGuide,
                                       clampRange: DimensionRange,
                                       alignment: VerticalAlignment,
                                       within maxValue: CGFloat) -> OffsetDimension {
        return offsetDimension(
            with: contentDimension,
            guide: guide,
            clampRange: clampRange,
            alignment: alignment.horizontalAlignment(),
            within: maxValue)
    }

}
