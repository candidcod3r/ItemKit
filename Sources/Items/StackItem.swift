//
//  StackItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum StackDistribution {
    case leading
    case trailing
    case center
    case equalSpacing
    case equalSize
    case fillExtraSpace
    case fillExtraSpaceEqually
}

public struct StackItem: ItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public private(set) var origin: CGPoint = .zero
    public private(set) var measurement: CGSize = .zero

    // MARK:- StackItem Properties
    public var axis: Axis
    public var spacing: CGFloat
    public var distribution: StackDistribution

    // MARK:- Designated intializer
    public init(id: String? = nil,
                axis: Axis = .horizontal,
                spacing: CGFloat = 0,
                distribution: StackDistribution,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                subItems: [ItemProtocol] = []) {
        self.id = id
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = subItems
    }
}

// MARK: Measurable
extension StackItem {
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
extension StackItem {
    public mutating func updateAlignments(within maxFrame: CGRect) {
        origin = originByUpdatingContentAlignments(within: maxFrame)
    }

    public mutating func updateContentAlignments(contentFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateAlignments(within: contentFrame)
        }
    }
}
