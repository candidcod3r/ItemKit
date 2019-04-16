//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

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
        measurement = measurementByUpdatingContentMeasurements(within: maxSize)
    }

    @discardableResult
    public mutating func contentMeasurementByUpdatingSubItemsMeasurements(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateMeasurements(within: maxSize)
        }
        return .zero
    }
}

// MARK: Layoutable
extension Item {
    public mutating func updateAlignments(within maxFrame: CGRect) {
        origin = originByUpdatingContentAlignments(within: maxFrame)
    }

    public mutating func updateContentAlignments(contentFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateAlignments(within: contentFrame)
        }
    }
}
