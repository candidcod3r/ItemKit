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
    case equalSize
    case equalSpacing
    case fillExtraSpace
    case fillExtraSpaceEqually
}

open class StackItem: Item {
    // MARK:- StackItem Properties
    open var axis: Axis
    open var spacing: CGFloat
    open var distribution: StackDistribution

    // MARK:- Designated intializer
    public init(id: String? = nil,
                axis: Axis = .horizontal,
                spacing: CGFloat = 0,
                distribution: StackDistribution = .leading,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility? = nil,
                subItems: [Itemable] = []) {
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution

        let flexibility = flexibility ?? StackItem.defaultFlexibility(for: axis, subItems: subItems)
        super.init(
            id: id,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            subItems: subItems)
    }

    static func defaultFlexibility(for axis: Axis, subItems: [Itemable]) -> Flexibility {
        var axisFlex = Flex.min
        var crossFlex = Flex.max
        for i in 0..<subItems.count {
            axisFlex = max(axisFlex, subItems[i].flexibility.value(along: axis))
            crossFlex = min(crossFlex,  subItems[i].flexibility.value(across: axis))
        }
        return Flexibility(axisValue: axisFlex, crossValue: crossFlex, axis: axis)
    }

    // MARK: Measurable
    open override func contentFittingSize(within maxSize: CGSize) -> CGSize {
        guard distribution != .equalSize else {
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

    // MARK: Layoutable
    open override func updateContentLayout(within maxFrame: CGRect) {
        let availableAxisLength = maxFrame.size.value(along: axis)
        let fittingAxisLength = contentFittingSize.value(along: axis)
        let excessAxisLength = availableAxisLength - fittingAxisLength

        let subItemOffset = self.subItemOffset(with: excessAxisLength)
        let subItemSpacing = self.subItemSpacing(with: excessAxisLength)
        let mostFlexibleSubItemIndex = self.mostFlexibleSubItemIndex()
        let maxSubItemSizeForEqualDistribution = self.maxSubItemSizeForEqualDistribution(within: maxFrame.size)

        var subItemAxisOrigin = AxisPoint(axis: axis, value: maxFrame.origin)
        subItemAxisOrigin.axisValue += subItemOffset

        for i in 0..<subItems.count {
            let maxSubItemSize = (distribution == .equalSize)
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
}

// MARK:- Private helpers (Equal distribution)
extension StackItem {
    private func contentFittingSizeForEqualDistribution(within maxSize: CGSize) -> CGSize {
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

// MARK:- Private helpers for Layoutable
extension StackItem {
    private func subItemOffset(with excessLength: CGFloat) -> CGFloat {
        switch distribution {
        case .leading,
             .equalSize,
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
             .equalSize,
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
            if maxFlex <= subItemflex {
                mostFlexibleIndex = i
            }
        }
        return mostFlexibleIndex
    }

    private func adjustedSubItemAxisSize(subItemSize: CGSize,
                                         within maxSize: CGSize,
                                         excessAxisLength: CGFloat,
                                         isMostFlexible: Bool) -> CGSize {
        let subItemAxisSize = AxisSize(axis: axis, value: subItemSize)
        let maxAxisSize = AxisSize(axis: axis, value: maxSize)

        let axisLength = subItemAxisSize.axisValue
        let crossLength = maxAxisSize.crossValue

        if distribution == .equalSize {
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

}

open class StackViewItem<View: UIView>: StackItem, ViewItemable {
    open var view: View?
}
