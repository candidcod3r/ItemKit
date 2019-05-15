//
//  UIView+Itemable.swift
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

    open func updateLayout<ItemType: Itemable & Cacheable>(with item: ItemType) {
        let itemCache = item.makeCache()
        updateLayout(with: itemCache)
    }

    open func updateLayout(with itemCache: ItemCache) {
        if let item = itemCache.item(for: itemID) {
            frame = item.frame
        }

        for subview in subviews {
            subview.updateLayout(with: itemCache)
        }
    }
}
