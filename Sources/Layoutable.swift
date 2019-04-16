//
//  Layoutable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Layoutable {
    mutating func updateLayouts(within maxFrame: CGRect)
    
    mutating func updateContentLayouts(within maxFrame: CGRect)
}

extension Layoutable where Self: ItemProtocol {
    mutating func getOriginAndUpdateContentLayouts(within maxFrame: CGRect) -> CGPoint {
        let origin = Aligner.origin(
            with: measurement,
            alignment: alignment,
            within: maxFrame)

        let maxContentSize = frame.size.decreased(by: insets)
        let contentOrigin: CGPoint = {
            if requiresView {
                return CGPoint(x: insets.left, y: insets.top)
            } else {
                return CGPoint(x: frame.origin.x + insets.left, y: frame.origin.y + insets.top)
            }
        }()

        let maxContentFrame = CGRect(origin: contentOrigin, size: maxContentSize)
        updateContentLayouts(within: maxContentFrame)

        return origin
    }
}
