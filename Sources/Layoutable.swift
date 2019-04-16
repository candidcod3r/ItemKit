//
//  Layoutable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Layoutable {
    mutating func updateAlignments(within maxFrame: CGRect)
    
    mutating func updateContentAlignments(contentFrame: CGRect)
}

extension Layoutable where Self: ItemProtocol {
    fileprivate func origin(within maxFrame: CGRect) -> CGPoint {
        return Aligner.origin(
            with: measurement,
            alignment: alignment,
            within: maxFrame)
    }

    fileprivate mutating func updateContentAlignments(within maxFrame: CGRect) {
        let contentSize = maxFrame.size.decreased(by: insets)
        let contentOrigin: CGPoint = {
            if requiresView {
                return CGPoint(x: insets.left, y: insets.top)
            } else {
                return CGPoint(x: maxFrame.origin.x + insets.left, y: maxFrame.origin.y + insets.top)
            }
        }()

        let contentFrame = CGRect(origin: contentOrigin, size: contentSize)
        updateContentAlignments(contentFrame: contentFrame)
    }

    mutating func originByUpdatingContentAlignments(within maxFrame: CGRect) -> CGPoint {
        let origin = self.origin(within: maxFrame)

        let fittingFrame = CGRect(origin: origin, size: measurement)
        updateContentAlignments(within: fittingFrame)

        return origin
    }
}
