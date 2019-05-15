//
//  Cacheable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/15/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Cacheable {
    func makeCache() -> ItemCache
}

extension Itemable {
    public func makeCache() -> ItemCache {
        let cache = ItemCache()
        self.add(to: cache)
        return cache
    }

    private func add(to cache: ItemCache) {
        let viewIDString = id ?? ""
        if !viewIDString.isEmpty {
            cache.setItem(self, for: viewIDString)
        }
        for subItem in subItems {
            subItem.add(to: cache)
        }
    }
}
