//
//  Itemable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Itemable: Measurable, Layoutable {
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
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0
    }
}

extension Itemable {
    public mutating func layoutViews(within containerView: UIView) {
        updateLayout(within: containerView.frame)

        layoutViews(for: self, in: containerView)
    }

    fileprivate func layoutViews(for item: Itemable, in containerView: UIView) {
        let viewItem = item as? UIViewItemable
        let itemView = viewItem?.itemView
        if let itemView = itemView {
            containerView.addSubview(itemView)
        }

        // set the frame of the view
        itemView?.frame = item.frame

        for subItem in item.subItems {
            layoutViews(for: subItem, in: itemView ?? containerView)
        }
    }
}

