//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public struct Item: ItemProtocol, Cacheable {
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public private(set) var origin: CGPoint = .zero
    public private(set) var measurement: CGSize = .zero

    public private(set) var parentFrame: CGRect = .zero

    public init(id: String? = nil,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                subItems: [Item] = []) {
        self.id = id
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = subItems
    }
}

// MARK: Measurable
extension Item {
    public mutating func updateMeasurements(within maxSize: CGSize) {
        let fittingSize = Sizer.fittingSize(within: maxSize, guide: sizeGuide)

        let contentFittingSize = fittingSize.decreased(by: insets)
        let contentMeasurement = updateContentMeasurements(within: contentFittingSize)

        if sizeGuide.width.isWrapContent || sizeGuide.height.isWrapContent {
            measurement = contentMeasurement.increased(by: insets)
        } else {
            measurement = fittingSize
        }
    }

    @discardableResult
    public mutating func updateContentMeasurements(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateMeasurements(within: maxSize)
        }
        return .zero
    }
}

// MARK: Layoutable
extension Item {
    public mutating func updateLayouts(within maxFrame: CGRect) {
        let origin = Aligner.origin(
            with: measurement,
            alignment: alignment,
            within: maxFrame)

        let maxContentSize = frame.size.decreased(by: insets)
        let contentOrigin: CGPoint = {
            if requiresView {
                return CGPoint(x: insets.left, y: insets.top)
            } else {
                return CGPoint(x: frame.origin.x + insets.left, y: frame.origin.y + insets.top)
            }
        }()

        let maxContentFrame = CGRect(origin: contentOrigin, size: maxContentSize)
        updateContentLayouts(within: maxContentFrame)

        self.origin = origin
    }

    public mutating func updateContentLayouts(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayouts(within: maxFrame)
        }
    }
}
