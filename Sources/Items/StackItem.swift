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
    var withinFrame: CGRect = .zero

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
                flexibility: Flexibility? = nil,
                subItems: [ItemProtocol] = []) {
        self.id = id
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility ?? StackItem.defaultFlexibility(for: axis, subItems: subItems)
        self.subItems = subItems
    }

    static func defaultFlexibility(for axis: Axis, subItems: [ItemProtocol]) -> Flexibility {
        var axisFlex = Flex.min
        var crossFlex = Flex.max
        for i in 0..<subItems.count {
            axisFlex = max(axisFlex, subItems[i].flexibility.value(along: axis))
            crossFlex = min(crossFlex,  subItems[i].flexibility.value(across: axis))
        }
        return Flexibility(axisValue: axisFlex, crossValue: crossFlex, axis: axis)
    }
}

// MARK: Measurable
extension StackItem {
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
        if distribution == .equal {
            return contentFittingSizeForEqualDistribution(within: maxSize)
        }

        let sortedIndices = indicesSortedByFlexibility()
        var availableAxisSize = AxisSize(axis: axis, value: maxSize)
        var usedSize = AxisSize(axis: axis, value: .zero)

        for i in sortedIndices {
            // as long as there is available size in either direction of axis
            if availableAxisSize.axisValue <= 0 || availableAxisSize.crossValue <= 0 {
                break
            }

            subItems[i].updateFittingSize(within: availableAxisSize.value)

            let subItemAxisFittingSize = AxisSize(axis: axis, value: subItems[i].fittingSize)
            let leadingSpace = (usedSize.axisValue > 0) ? spacing : 0
            usedSize.axisValue += leadingSpace + subItemAxisFittingSize.axisValue
            usedSize.crossValue = max(usedSize.crossValue, subItemAxisFittingSize.crossValue)
            availableAxisSize.axisValue -= subItemAxisFittingSize.axisValue + spacing
        }

        return usedSize.value
    }

    // MARK:- Private helpers (Equal distribution)
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

        // CGFloat to make the calculations look more readable
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
        // CGFloat to make the calculations look more readable
        let subItemsCount = CGFloat(subItems.count)

        if subItemsCount <= 1 {
            return totalLength
        } else {
            let totalSpacing = (subItemsCount - 1) * spacing
            let totalAvailableSpace = abs(totalLength - totalSpacing)
            return totalAvailableSpace / subItemsCount
        }
    }

    // MARK:- Private helpers
    private func indicesSortedByFlexibility() -> [Int] {
        let indexedSubItems = subItems.indexedValues()
        let sortedIndexedSubItems = indexedSubItems.sorted { (indexedValue1, indexedValue2) -> Bool in
            let flex1 = indexedValue1.value.flexibility.value(along: axis)
            let flex2 = indexedValue2.value.flexibility.value(along: axis)

            return (flex1 == flex2)
                ? indexedValue1.index < indexedValue2.index
                : flex1 < flex2
        }

        return sortedIndexedSubItems.map { $0.index }
    }
}

// MARK: Layoutable
extension StackItem {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
        let availableAxisLength = maxFrame.size.value(along: axis)
        let fittingAxisLength = fittingSize.value(along: axis)
        let excessAxisLength = availableAxisLength - fittingAxisLength

        let subItemOffset = self.subItemOffset(with: excessAxisLength)
        let subItemSpacing = self.subItemSpacing(with: excessAxisLength)
        let mostFlexibleSubItemIndex = self.mostFlexibleSubItemIndex()
        let maxSubItemSizeForEqualDistribution = self.maxSubItemSizeForEqualDistribution(within: maxFrame.size)

        var subItemAxisOrigin = AxisPoint(axis: axis, value: maxFrame.origin)
        subItemAxisOrigin.axisValue += subItemOffset

        for i in 0..<subItems.count {
            let maxSubItemSize = (distribution == .equal)
                ? maxSubItemSizeForEqualDistribution
                : adjustedSubItemAxisSize(
                    subItemSize: subItems[i].fittingSize,
                    within: maxFrame.size,
                    excessAxisLength: excessAxisLength,
                    isMostFlexible: i == mostFlexibleSubItemIndex)
            let maxSubItemFrame = CGRect(origin: subItemAxisOrigin.value, size: maxSubItemSize)
            subItems[i].updateLayout(within: maxSubItemFrame)

            subItemAxisOrigin.axisValue += maxSubItemSize.value(along: axis)
            subItemAxisOrigin.axisValue += (subItemAxisOrigin.axisValue > 0) ? subItemSpacing : 0
        }
    }

    private func adjustedSubItemAxisSize(subItemSize: CGSize,
                                         within maxSize: CGSize,
                                         excessAxisLength: CGFloat,
                                         isMostFlexible: Bool) -> CGSize {
        let subItemAxisSize = AxisSize(axis: axis, value: subItemSize)
        let maxAxisSize = AxisSize(axis: axis, value: maxSize)

        let axisLength = subItemAxisSize.axisValue
        let crossLength = maxAxisSize.crossValue

        if distribution == .equal {
            return maxSubItemSizeForEqualDistribution(within: maxSize)
        } else if distribution == .fillExtraSpace && isMostFlexible {
            return CGSize(axisValue: axisLength + excessAxisLength, crossValue: crossLength, axis: axis)
        } else if distribution == .fillExtraSpaceEqually {
            let count = (subItems.count == 0) ? 1 : subItems.count
            let additionalAxisLength = excessAxisLength / CGFloat(count)
            return CGSize(axisValue: axisLength + additionalAxisLength, crossValue: crossLength, axis: axis)
        } else {
            return CGSize(axisValue: axisLength, crossValue: crossLength, axis: axis)
        }
    }

    private func subItemOffset(with excessLength: CGFloat) -> CGFloat {
        switch distribution {
        case .leading,
             .equal,
             .equalSpacing,
             .fillExtraSpace,
             .fillExtraSpaceEqually:
            return 0
        case .trailing:
            return excessLength
        case .center:
            return excessLength/CGFloat(2)
        }
    }

    private func subItemSpacing(with excessLength: CGFloat) -> CGFloat {
        switch distribution {
        case .leading,
             .trailing,
             .center,
             .equal,
             .fillExtraSpace,
             .fillExtraSpaceEqually:
            return spacing
        case .equalSpacing:
            if subItems.count <= 1 {
                return excessLength
            } else {
                let spacingsCount = CGFloat(subItems.count - 1)
                let totalSpacing = spacingsCount * spacing + excessLength
                return totalSpacing / spacingsCount
            }
        }
    }

    private func mostFlexibleSubItemIndex() -> Int {
        guard subItems.count > 0 else {
            return -1
        }

        var mostFlexibleIndex = 0
        for i in 0..<subItems.count {
            let maxFlex = subItems[mostFlexibleIndex].flexibility.value(along: axis)
            let subItemflex = subItems[i].flexibility.value(along: axis)
            if maxFlex < subItemflex {
                mostFlexibleIndex = i
            }
        }
        return mostFlexibleIndex
    }

}
