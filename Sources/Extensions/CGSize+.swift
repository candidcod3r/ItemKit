//
//  CGSize+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGSize {

    func insetted(by insets: UIEdgeInsets) -> CGSize {
        let insettedWidth = width + insets.totalHorizontal
        let insettedHeight = height + insets.totalVertical
        return CGSize(width: insettedWidth, height: insettedHeight)
    }

    func increased(by insets: UIEdgeInsets) -> CGSize {
        let increasedWidth = width + insets.totalHorizontal
        let increasedHeight = height + insets.totalVertical
        return CGSize(width: increasedWidth, height: increasedHeight)
    }

    func decreased(by insets: UIEdgeInsets) -> CGSize {
        let decreasedWidth = width - insets.totalHorizontal
        let decreasedHeight = height - insets.totalVertical
        return CGSize(width: decreasedWidth, height: decreasedHeight)
    }

    func increased(to maxSize: CGSize) -> CGSize {
        return limit(to: maxSize, limitFunc: max)
    }

    func decreased(to minSize: CGSize) -> CGSize {
        return limit(to: minSize, limitFunc: min)
    }

    private func limit(to size: CGSize, limitFunc: (CGFloat, CGFloat) -> CGFloat) -> CGSize {
        let limitedWidth = limitFunc(width, size.width)
        let limitedHeight = limitFunc(height, size.height)
        return CGSize(width: limitedWidth, height: limitedHeight)
    }

    func clamp(min minSize: CGSize, max maxSize: CGSize) -> CGSize {
        let clampedWidth = ItemKit.clamp(width, within: minSize.width...maxSize.width)
        let clampedHeight = ItemKit.clamp(height, within: minSize.height...maxSize.height)
        return CGSize(width: clampedWidth, height: clampedHeight)
    }

    var roundedUp: CGSize {
        let roundedUpWidth = width.roundedUp
        let roundedUpHeight = height.roundedUp
        return CGSize(width: roundedUpWidth, height: roundedUpHeight)
    }

}
