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
    case equal
    case equalSpacing
    case fillExtraSpace
    case fillExtraSpaceEqually
}

public struct StackItem: InternalItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public internal(set) var frame: CGRect = .zero
    public internal(set) var fittingSize: CGSize = .zero
    var withinOrigin: CGPoint = .zero
    var withinSize: CGSize = .zero

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
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
        if distribution == .equal {
            return contentFittingSizeForEqualDistribution(within: maxSize)
        }

        var contentFittingSize = CGSize.zero
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
            contentFittingSize = subItems[i].fittingSize

        }
        return contentFittingSize
    }

    // MARK:- Private helpers

    private mutating func contentFittingSizeForEqualDistribution(within maxSize: CGSize) -> CGSize {
        let maxSubItemSize = maxSubItemSizeForEqualDistribution(within: maxSize)

        var maxSubItemAxisLength = CGFloat.leastNormalMagnitude
        var contentFittingCrossLength = CGFloat.leastNormalMagnitude

        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSubItemSize)

            let subItemAxisLength = subItems[i].fittingSize.value(along: axis)
            let subItemCrossLength = subItems[i].fittingSize.value(across: axis)

            maxSubItemAxisLength = max(maxSubItemAxisLength, subItemAxisLength)
            contentFittingCrossLength = max(contentFittingCrossLength, subItemCrossLength)
        }

        // CGFloat because to make the calculations look more readable
        let subItemsCount = CGFloat(subItems.count)
        let contentFittingAxisLength = (maxSubItemAxisLength + spacing) * subItemsCount - spacing

        return CGSize(axisValue: contentFittingAxisLength, crossValue: contentFittingCrossLength, axis: axis)
    }

    private func maxSubItemSizeForEqualDistribution(within size: CGSize) -> CGSize {
        let axisLength = size.value(along: axis)
        let crossLength = size.value(across: axis)
        let maxSubItemLength = maxSubItemLengthForEqualDistribution(within: axisLength)
        return CGSize(axisValue: maxSubItemLength, crossValue: crossLength, axis: axis)
    }

    private func maxSubItemLengthForEqualDistribution(within totalLength: CGFloat) -> CGFloat {
        // CGFloat because to make the calculations look more readable
        let subItemsCount = CGFloat(subItems.count)

        if subItemsCount <= 1 {
            return totalLength
        } else {
            let totalSpacing = (subItemsCount - 1) * spacing
            let totalAvailableSpace = abs(totalLength - totalSpacing)
            return totalAvailableSpace / subItemsCount
        }
    }

}

// MARK: Layoutable
extension StackItem {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayout(within: maxFrame)
        }
    }
}
