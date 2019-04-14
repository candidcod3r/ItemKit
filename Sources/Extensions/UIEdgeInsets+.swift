//
//  UIEdgeInsets+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIEdgeInsets {

    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    public init(_ value: CGFloat) {
        self.init(horizontal: value, vertical: value)
    }

    var totalHorizontal: CGFloat {
        return left + right
    }

    var totalVertical: CGFloat {
        return top + bottom
    }

    public func offsetted(by offset: UIOffset) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top + offset.vertical,
            left: left + offset.horizontal,
            bottom: bottom + offset.vertical,
            right: right + offset.horizontal
        )
    }

    public func clamp(within range: ClosedRange<CGFloat>) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: ItemKit.clamp(top, within: range),
            left: ItemKit.clamp(left, within: range),
            bottom: ItemKit.clamp(bottom, within: range),
            right: ItemKit.clamp(right, within: range))
    }

    public func clamp(min: CGFloat, max: CGFloat) -> UIEdgeInsets {
        let closedRange = min...max
        return clamp(within: closedRange)
    }

}
