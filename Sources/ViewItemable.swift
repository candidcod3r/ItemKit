//
//  ViewItemable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/11/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Configurable {
    /**
     Configure the view with required properties
     */
    func configureView()
}

public protocol ViewItemable: Itemable, Configurable, UIViewItemable {
    associatedtype View: UIView
    var view: View? { get }
}

extension ViewItemable {
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0 && (view != nil)
    }

    public var itemView: UIView? {
        return view
    }
}

public protocol UIViewItemable {
    var itemView: UIView? { get }
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

        // configure the view
        let configurableItem = item as? Configurable
        configurableItem?.configureView()

        // set the frame of the view
        itemView?.frame = item.frame

        for subItem in item.subItems {
            layoutViews(for: subItem, in: itemView ?? containerView)
        }
    }
}
