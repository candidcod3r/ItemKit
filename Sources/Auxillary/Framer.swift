//
//  Framer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Framer {

    public static func frame(with contentSize: CGSize,
                             sizeGuide: SizeGuide,
                             alignment: Alignment,
                             within maxFrame: CGRect) -> CGRect {
        let size = Sizer.size(with: contentSize, guide: sizeGuide, within: maxFrame.size)
        return frame(with: size, alignment: alignment, within: maxFrame)
    }

    public static func frame(with size: CGSize,
                             alignment: Alignment,
                             within maxFrame: CGRect) -> CGRect {
        let xOffset = alignment.horizontal.offet(with: size.width, within: maxFrame.size.width)
        let yOffset = alignment.vertical.offet(with: size.height, within: maxFrame.size.height)

        return CGRect(
            x: maxFrame.origin.x + xOffset,
            y: maxFrame.origin.y + yOffset,
            width: size.width,
            height: size.height)
    }

}
