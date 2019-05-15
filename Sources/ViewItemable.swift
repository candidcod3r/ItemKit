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
    func configure()
}

public protocol ViewItemable: Itemable, Configurable, UIViewItemable {
    associatedtype View: UIView

    // backing view
    var view: View { get }

    // make the view
    var makeView: (() -> View)? { get }

    // prepare the view before the layout
    var configureView: ((View) -> Void)? { get }
}

extension ViewItemable {
    public var itemView: UIView {
        return view
    }

    public static func makeView() -> View {
        return View()
    }
}

public protocol UIViewItemable {
    var itemView: UIView { get }
}

extension Itemable {
    /**
     Layout the item's view and its subitems views within the container view.
     */
    public mutating func layoutViews(within containerView: UIView) {
        updateLayout(within: containerView.bounds)

        layoutViews(for: self, in: containerView)
    }

    /**
     Layout the item's view and its subitems views within the given rect.
     */
    public mutating func layoutViews(within rect: CGRect) {
        updateLayout(within: rect)

        layoutViews(for: self)
    }

    /**
     Layout the item's view and its subitems views in the container view.
     */
    fileprivate func layoutViews(for item: Itemable, in containerView: UIView? = nil) {
        let viewItem = item as? UIViewItemable
        let itemView = viewItem?.itemView
        if let itemView = itemView {
            containerView?.addSubview(itemView)
        }

        // configure the view
        let configurableItem = item as? Configurable
        configurableItem?.configure()

        // set the frame of the view
        itemView?.frame = item.frame

        for subItem in item.subItems {
            layoutViews(for: subItem, in: itemView ?? containerView)
        }
    }
}
