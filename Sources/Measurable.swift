//
//  Measurable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Measurable {
    mutating func updateMeasurements(within maxSize: CGSize)

    @discardableResult
    mutating func contentMeasurementByUpdatingSubItemsMeasurements(within maxSize: CGSize) -> CGSize
}

extension Measurable where Self: ItemProtocol {
    mutating func measurementByUpdatingContentMeasurements(within maxSize: CGSize) -> CGSize {
        let fittingSize = Sizer.fittingSize(within: maxSize, guide: sizeGuide)

        // decrease the insets so that the content measurements takes the decreased size
        let contentFittingSize = fittingSize.decreased(by: insets)

        // get the contentMeasurement by updating the subItem measurements
        let contentMeasurement = contentMeasurementByUpdatingSubItemsMeasurements(within: contentFittingSize)

        // return the fittingSize in all cases other than wrapContent
        guard sizeGuide.width.isWrapContent || sizeGuide.height.isWrapContent else {
            return fittingSize
        }

        var size = fittingSize
        if sizeGuide.width.isWrapContent {
            // increase the width for the decreased insets above
            size.width = contentMeasurement.width + insets.totalHorizontal
        }

        if sizeGuide.height.isWrapContent {
            // increase the height for the decreased insets above
            size.height = contentMeasurement.height + insets.totalVertical
        }

        return size
    }
}
