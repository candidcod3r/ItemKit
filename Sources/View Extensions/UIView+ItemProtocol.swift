//
//  UIView+Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

private var itemIDKey: UInt8 = 0

extension UIView {
    public internal(set) var itemID: String? {
        get {
            return objc_getAssociatedObject(self, &itemIDKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &itemIDKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    public func updateLayout<Item: ItemProtocol>(with item: Item) where Item: Cacheable {
        let itemCache = item.createCache()
        updateLayout(with: itemCache)
    }

    public func updateLayout(with itemCache: ViewItemCache) {
        if let item = itemCache.viewItem(for: itemID) {
            frame = item.frame
        }

        for subview in subviews {
            subview.updateLayout(with: itemCache)
        }
    }
}
