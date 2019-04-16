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

        let contentFittingSize = fittingSize.decreased(by: insets)
        let contentMeasurement = contentMeasurementByUpdatingSubItemsMeasurements(within: contentFittingSize)

        if sizeGuide.width.isWrapContent || sizeGuide.height.isWrapContent {
            return contentMeasurement.increased(by: insets)
        } else {
            return fittingSize
        }
    }
}
