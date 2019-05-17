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

    /**
     Insets inside the Itemable, note that insets contribute to the width and height of the Itemable
     */
    var insets: UIEdgeInsets { get }

    /**
     Size guide for computing the width and height of the Itemable
     */
    var sizeGuide: SizeGuide { get }

    /**
     Alignment defines the positioning of the Itemable
     */
    var alignment: Alignment { get }

    /**
     Flexibility is relative measure of strechability with other Itemables
     */
    var flexibility: Flexibility { get }

    /**
     Sub Itemables of the Item
     */
    var subItems: [Itemable] { get }

    /**
     Indicates whether a view is required for representing this Itemable
     */
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
