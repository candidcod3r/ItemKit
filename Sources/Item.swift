//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public struct Item: ItemProtocol {
    public var viewID: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [Item]

    public private(set) var origin: CGPoint = .zero
    public private(set) var measurement: CGSize = .zero

    public private(set) var parentFrame: CGRect = .zero

    public init(viewID: String?,
                insets: UIEdgeInsets,
                sizeGuide: SizeGuide,
                alignment: Alignment,
                flexibility: Flexibility,
                subItems: [Item]) {
        self.viewID = viewID
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = subItems
    }
}

extension Item: Measurable {

    public func updateMeasurement(within maxSize: CGSize) {

    }

    public func intrinsicSize(within maxSize: CGSize) -> CGSize {
        return .zero
    }

}

extension Item: Layoutable {
    public func updateLayout(within frame: CGRect) { }
}
