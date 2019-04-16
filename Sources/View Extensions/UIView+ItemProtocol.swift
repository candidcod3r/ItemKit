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

    public func updateLayouts<Item: ItemProtocol>(with item: Item) where Item: Cacheable {
        let itemCache = item.createCache()
        updateLayouts(with: itemCache)
    }

    public func updateLayouts(with itemCache: ViewItemCache) {
        if let item = itemCache.viewItem(for: itemID) {
            frame = item.frame
        }

        for subview in subviews {
            subview.updateLayouts(with: itemCache)
        }
    }

}
