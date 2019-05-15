//
//  Itemable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Itemable: Measurable, Layoutable, Cacheable {
    /**
     Unique ID that represents the item
     */
    var id: String? { get }
    var insets: UIEdgeInsets { get }
    var sizeGuide: SizeGuide { get }
    var alignment: Alignment { get }
    var flexibility: Flexibility { get }
    var subItems: [Itemable] { get }
    var requiresView: Bool { get }
}


extension Itemable {
    /**
     Update the item's and subItem's layout within maxFrame.
     */
    public mutating func updateLayout(within maxFrame: CGRect) {
        // update the fitting sizes
        updateFittingSizes(within: maxFrame.size)

        // update the frames
        updateFrames(within: maxFrame)
    }

    /**
     Update the item's and subItem's layout within boundingSize.
     */
    public mutating func updateLayout(within boundingSize: CGSize) {
        let maxFrame = CGRect(x: 0, y: 0, width: boundingSize.width, height: boundingSize.height)
        updateLayout(within: maxFrame)
    }
}
