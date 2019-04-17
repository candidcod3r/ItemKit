//
//  UIEdgeInsets+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIEdgeInsets {

    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }

    init(_ value: CGFloat) {
        self.init(horizontal: value, vertical: value)
    }

    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    var totalHorizontal: CGFloat {
        return left + right
    }

    var totalVertical: CGFloat {
        return top + bottom
    }

    func offsetted(by offset: UIOffset) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top + offset.vertical,
            left: left + offset.horizontal,
            bottom: bottom + offset.vertical,
            right: right + offset.horizontal)
    }

    func offsettedtTop(by offset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top + offset,
            left: left,
            bottom: bottom,
            right: right)
    }

    func offsettedtLeft(by offset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top,
            left: left + offset,
            bottom: bottom,
            right: right)
    }

    func offsettedBottom(by offset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom + offset,
            right: right)
    }

    func offsettedtRight(by offset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top,
            left: left,
            bottom: bottom,
            right: right + offset)
    }

    func removedTop() -> UIEdgeInsets {
        return UIEdgeInsets(
            top: 0,
            left: left,
            bottom: bottom,
            right: right)
    }

    func removedBottom() -> UIEdgeInsets {
        return UIEdgeInsets(
            top: top,
            left: left,
            bottom: 0,
            right: right)
    }

    func clamp(within range: ClosedRange<CGFloat>) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: ItemKit.clamp(top, within: range),
            left: ItemKit.clamp(left, within: range),
            bottom: ItemKit.clamp(bottom, within: range),
            right: ItemKit.clamp(right, within: range))
    }

    func clamp(min: CGFloat, max: CGFloat) -> UIEdgeInsets {
        let closedRange = min...max
        return clamp(within: closedRange)
    }

    func negated() -> UIEdgeInsets {
        return UIEdgeInsets(
            top: -top,
            left: -left,
            bottom: -bottom,
            right: -right)
    }
}
