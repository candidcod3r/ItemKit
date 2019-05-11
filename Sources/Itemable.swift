//
//  Itemable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Itemable: Measurable, Layoutable, Configurable {
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

    var itemView: UIView? { get }
}

extension Itemable {
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0
    }
}

extension Item {
    public var itemView: UIView? {
        return view
    }
}
