//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public struct Item: ItemProtocol {
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [Item]

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

    public func createViewItemCache() -> ViewItemCache {
        let cache = ViewItemCache()
        addToViewItemCache(cache)
        return cache
    }

    private func addToViewItemCache(_ cache: ViewItemCache) {
        let viewIDString = id ?? ""
        if !viewIDString.isEmpty {
            cache .setViewItem(self, for: viewIDString)
        }
        for subItem in subItems {
            subItem.addToViewItemCache(cache)
        }
    }

}

extension Item: Measurable {

    @discardableResult
    public mutating func updateMeasurements(within maxSize: CGSize) -> CGSize {
        let fittingSize = Sizer.fittingSize(within: maxSize, guide: sizeGuide)

        let contentFittingSize = fittingSize.decreased(by: insets)
        let contentMeasurement = updateContentMeasurements(within: contentFittingSize)

        if sizeGuide.width.isWrapContent || sizeGuide.height.isWrapContent {
            measurement = contentMeasurement.increased(by: insets)
        } else {
            measurement = fittingSize
        }

        return measurement
    }

    @discardableResult
    public mutating func updateContentMeasurements(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateMeasurements(within: maxSize)
        }
        return .zero
    }

}

extension Item: Layoutable {

    @discardableResult
    public func updateLayouts(within maxFrame: CGRect) -> CGRect {
        let frame = Framer.frame(
            with: measurement,
            alignment: alignment,
            within: maxFrame)

        let contentMaxSize = frame.size.decreased(by: insets)

        let contentOrigin = (requiresView)
            ? CGPoint(x: insets.left, y: insets.top)
            : CGPoint(x: frame.origin.x + insets.left, y: frame.origin.y + insets.top)

        let contentMaxRect = CGRect(origin: contentOrigin, size: contentMaxSize)
        for i in 0..<subItems.count {
            subItems[i].updateLayouts(within: contentMaxRect)
        }

        return frame
    }

}
