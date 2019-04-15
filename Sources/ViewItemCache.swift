//
//  ViewItemCache.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public class ViewItemCache {
    public typealias BackingStore = [String : Item]

    public private(set) var store: BackingStore!

    public init() {
        store = BackingStore()
    }

    public func viewItem(for key: String?) -> Item? {
        guard let key = key else {
            return nil
        }
        return store[key]
    }

    public func setViewItem(_ item: Item, for key: String) {
        store[key] = item
    }

    public func allKeys() -> [String] {
        return store.keys.map { $0 }
    }
}