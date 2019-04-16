//
//  TextItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct TextItem: ItemProtocol, Cacheable {
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public internal(set) var origin: CGPoint = .zero
    public internal(set) var measurement: CGSize = .zero

    public private(set) var parentFrame: CGRect = .zero

    public init(id: String? = nil,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.id = id
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = []
    }
}

// MARK: Measurable
extension TextItem {

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
extension TextItem {
    public mutating func updateLayouts(within maxFrame: CGRect) {
        origin = originByUpdatingContentLayouts(within: maxFrame)
    }

    public mutating func updateContentLayouts(contentFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayouts(within: contentFrame)
        }
    }
}

