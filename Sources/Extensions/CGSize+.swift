//
//  CGSize+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGSize {

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
        return clamp(to: maxSize, clampFunc: max)
    }

    func decreased(to minSize: CGSize) -> CGSize {
        return clamp(to: minSize, clampFunc: min)
    }

    func clamp(to size: CGSize, clampFunc: (CGFloat, CGFloat) -> CGFloat) -> CGSize {
        let clampedWidth = clampFunc(width, size.width)
        let clampedHeight = clampFunc(height, size.height)
        return CGSize(width: clampedWidth, height: clampedHeight)
    }

    var roundedUp: CGSize {
        let roundedUpWidth = width.roundedUp
        let roundedUpHeight = height.roundedUp
        return CGSize(width: roundedUpWidth, height: roundedUpHeight)
    }

}
