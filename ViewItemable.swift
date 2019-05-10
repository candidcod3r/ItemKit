//
//  ViewItemable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/10/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol ViewItemable: Itemable {
    var itemView: UIView? { get }
}

extension ViewItemable {
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0 || itemView != nil
    }
}

extension ViewItemable {
    public mutating func layoutViews(within containerView: UIView) {
        updateLayout(within: containerView.frame)

        layoutViews(for: self, in: containerView)
    }

    fileprivate func layoutViews(for item: Itemable, in containerView: UIView) {
        let viewItemable = item as? ViewItemable
        let itemView = viewItemable?.itemView
        if let itemView = itemView {
            containerView.addSubview(itemView)
        }

        // set the frame of the view
        itemView?.frame = item.frame
        itemView?.configure(with: item)

        for subItem in item.subItems {
            layoutViews(for: subItem, in: itemView ?? containerView)
        }
    }
}

protocol InternalViewItemable: ViewItemable {
    associatedtype View: UIView

    var view: View? { get }
}

extension InternalViewItemable {
    public var view: View? {
        return itemView as? View
    }
}
