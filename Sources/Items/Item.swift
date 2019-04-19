//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Item: InternalItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public internal(set) var frame: CGRect = .zero
    public internal(set) var fittingSize: CGSize = .zero
    public internal(set) var contentFittingSize: CGSize = .zero

    // MARK:- Internal
    var withinFrame: CGRect = .zero

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

// MARK:- Measurable
extension Item {
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
        var contentFittingSize = CGSize.zero
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
            contentFittingSize = subItems[i].fittingSize

        }
        return Sizer.fittingSize(within: contentFittingSize, using: sizeGuide)
    }
}

// MARK:- Layoutable
extension Item {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayout(within: maxFrame)
        }
    }
}
