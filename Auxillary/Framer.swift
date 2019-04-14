//
//  Framer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct Framer {
    typealias CoordinateDimension = (coordinate: CGFloat, dimension: CGFloat)

    public static func frame(with size: CGSize,
                             guide: SizeGuide,
                             alignment: Alignment,
                             within frame: CGRect) -> CGRect {
        let horizontal = coordinateDimension(
            with: size.width,
            guide: guide.width,
            clampRange: guide.widthRange,
            alignment: alignment.horizontal,
            within: frame.width)

        let vertical = coordinateDimension(
            with: size.height,
            guide: guide.height,
            clampRange: guide.heightRange,
            alignment: alignment.vertical,
            within: frame.height)

        return CGRect(
            x: frame.origin.x + horizontal.coordinate,
            y: frame.origin.y + vertical.coordinate,
            width: horizontal.dimension,
            height: vertical.dimension)
    }

    public static func coordinateDimension(with value: CGFloat,
                                           guide: DimensionGuide,
                                           clampRange: DimensionRange,
                                           alignment: HorizontalAlignment,
                                           within maxValue: CGFloat) -> CoordinateDimension {
        let value: CGFloat = {
            switch guide {
            case .fixed(let value):
                return value
            case .percentageParent(let value):
                return maxValue * clamp(value, within: 0...1)
            case .wrapContent:
                return value
            case .fillParent:
                return maxValue
            }
        }()

        let dimension = clamp(value, within: clampRange)

        let excessValue = max(maxValue - value, 0)
        let coordinate: CGFloat
        switch alignment {
        case .leading:
            coordinate = 0
        case .trailing:
            coordinate = excessValue
        case .center:
            coordinate = excessValue / 2.0
        }

        return (coordinate, dimension)
    }

    public static func coordinateDimension(with value: CGFloat,
                                           guide: DimensionGuide,
                                           clampRange: DimensionRange,
                                           alignment: VerticalAlignment,
                                           within maxValue: CGFloat) -> CoordinateDimension {
        return coordinateDimension(
            with: value,
            guide: guide,
            clampRange: clampRange,
            alignment: alignment.horizontalAlignment(),
            within: maxValue)
    }

}
