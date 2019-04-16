//
//  Layoutable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Layoutable {
    mutating func updateLayouts(within maxFrame: CGRect)
    
    mutating func updateContentLayouts(contentFrame: CGRect)
}

extension Layoutable where Self: ItemProtocol {
    func origin(within maxFrame: CGRect) -> CGPoint {
        return Aligner.origin(
            with: measurement,
            alignment: alignment,
            within: maxFrame)
    }

    mutating func updateContentLayouts(withinFrame maxFrame: CGRect) {
        let contentSize = maxFrame.size.decreased(by: insets)
        let contentOrigin: CGPoint = {
            if requiresView {
                return CGPoint(x: insets.left, y: insets.top)
            } else {
                return CGPoint(x: maxFrame.origin.x + insets.left, y: maxFrame.origin.y + insets.top)
            }
        }()

        let contentFrame = CGRect(origin: contentOrigin, size: contentSize)
        updateContentLayouts(contentFrame: contentFrame)
    }

    mutating func originByUpdatingContentLayouts(within maxFrame: CGRect) -> CGPoint {
        updateContentLayouts(withinFrame: maxFrame)
        let origin = self.origin(within: maxFrame)
        return origin
    }
}
