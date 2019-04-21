//
//  Layoutable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Layoutable {
    /**
     Frame of the layoutable.
     */
    var frame: CGRect { get }

    /**
     Update the layout including the sublayouts of the layoutable if available.

     - Parameter maxFrame: Layout updated with in the maxFrame rect for the layoutable
     */
    mutating func updateLayout(within maxFrame: CGRect)

    /**
     Update the content layouts of the layoutable. Callers mostly likely doens't have to call this method direclty.

     - Parameter maxFrame: Content layout updated with in the maxFrame rect for the layoutable
     */
    mutating func updateContentLayout(within maxFrame: CGRect)
}
