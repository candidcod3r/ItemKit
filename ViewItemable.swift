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

public protocol ViewItemable: Itemable, UIViewItemable {
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


// TODO remove from everywhere and use this
extension ViewItemable where Self: Item  {
    // MARK:- Configurable
    public func configureView() {
        view?.configure(with: self)
        for subItem in subItems {
            (subItem as? Configurable)?.configureView()
        }
    }
}
