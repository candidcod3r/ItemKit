//
//  Global.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//
 
@inlinable func clamp<T>(_ value: T, within range: ClosedRange<T>) -> T where T : Comparable {
    return min(range.upperBound, max(value, range.lowerBound))
}
