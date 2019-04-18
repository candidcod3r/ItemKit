//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Item: ItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public private(set) var origin: CGPoint = .zero
    public private(set) var measurement: CGSize = .zero

    // MARK:- Designated intializer
    public init(id: String? = nil,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                subItems: [ItemProtocol] = []) {
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
        var contentMeasurement = CGSize.zero
        for i in 0..<subItems.count {
            subItems[i].updateMeasurements(within: maxSize)
            contentMeasurement += subItems[i].measurement
        }
        return contentMeasurement
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
