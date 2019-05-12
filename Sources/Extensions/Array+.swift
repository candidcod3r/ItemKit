//
//  Array+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/11/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension Array {
    func `as`<T>(_ type: T.Type) -> [T] {
        return compactMap { (element) in
            (element as? T)
        }
    }
}
