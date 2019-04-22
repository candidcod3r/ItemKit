//
//  Cacheable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/15/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Cacheable {
    func makeCache() -> ViewItemCache
}

extension Itemable {
    public func makeCache() -> ViewItemCache {
        let cache = ViewItemCache()
        self.add(to: cache)
        return cache
    }

    func add(to cache: ViewItemCache) {
        let viewIDString = id ?? ""
        if !viewIDString.isEmpty {
            cache.setViewItem(self, for: viewIDString)
        }
        for subItem in subItems {
            subItem.add(to: cache)
        }
    }
}
