//
//  Classes.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/12/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation
import UIKit

public enum Adaptability: Int {
    case min = 0
    case low = 250
    case normal = 500
    case high = 750
    case max = 1000
}

public enum DimensionValue {
    case fixed(CGFloat)
    case wrapContent
    case percentageParent(CGFloat)
    case fillParent
}

public struct DimensionRange {
    public var min: CGFloat
    public var max: CGFloat

    public init(min: CGFloat = .leastNormalMagnitude, max: CGFloat = .greatestFiniteMagnitude) {
        self.min = min
        self.max = max
    }
}

public struct SizeGuide {
    public var width: DimensionValue
    public var widthRange: DimensionRange

    public var height: DimensionValue
    public var heightRange: DimensionRange

    public init(width: DimensionValue, widthRange: DimensionRange, height: DimensionValue, heightRange: DimensionRange) {
        self.width = width
        self.widthRange = widthRange
        self.height = height
        self.heightRange = heightRange
    }
}

public enum HorizontalAlignment {
    case leading
    case center
    case trailing
}

public enum VerticalAlignment {
    case top
    case center
    case bottom
}

public struct Alignment {
    public var horizontal: HorizontalAlignment
    public var vertical:VerticalAlignment

    public init(horizontal: HorizontalAlignment, vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
}

public protocol ItemProtocol {
    var viewID: String? { get set }
    var insets: UIEdgeInsets { get set }
    var sizeGuide: SizeGuide { get set }
    var alignment: Alignment { get set }
    var adaptability: Adaptability { get set }
    var subItems: [Self] { get set }

    var origin: CGPoint { get }
    var measurement: CGSize { get }

    var parentFrame: CGRect { get }

    var requiresView: Bool { get }
    var frame: CGRect { get }
}

extension ItemProtocol {
    public var requiresView: Bool {
        return (viewID?.count ?? 0) > 0
    }

    public var frame: CGRect {
        return CGRect(origin: origin, size: measurement)
    }
}

public struct Item: ItemProtocol {
    public var viewID: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var adaptability: Adaptability
    public var subItems: [Item]

    public private(set) var origin: CGPoint = .zero
    public private(set) var measurement: CGSize = .zero

    public private(set) var parentFrame: CGRect = .zero

    public init(viewID: String?,
         insets: UIEdgeInsets,
         sizeGuide: SizeGuide,
         alignment: Alignment,
         adaptability: Adaptability,
         subItems: [Item]) {
        self.viewID = viewID
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.adaptability = adaptability
        self.subItems = subItems
    }
}

extension Item: Measurable {
    public func updateMeasurement(within size: CGSize) { }
}

extension Item: Frameable {
    public func updateLayout(within frame: CGRect) { }
}

public protocol Measurable {
    func updateMeasurement(within size: CGSize)
}

public protocol Frameable {
    func updateLayout(within frame: CGRect)
}

//struct TextItem: ItemProtocol {
//}
//
//struct ButtonItem: ItemProtocol {
//}
//
//struct StackItem: ItemProtocol {
//}
