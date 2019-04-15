//
//  Framer.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct Framer {

    public static func origin(with size: CGSize,
                              alignment: Alignment,
                              within maxFrame: CGRect) -> CGPoint {
        let xOffset = alignment.horizontal.offet(with: size.width, within: maxFrame.size.width)
        let yOffset = alignment.vertical.offet(with: size.height, within: maxFrame.size.height)

        return CGPoint(
            x: maxFrame.origin.x + xOffset,
            y: maxFrame.origin.y + yOffset)
    }

}
