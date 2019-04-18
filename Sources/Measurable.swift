//
//  Measurable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Measurable {
    mutating func updateFittingSize(within maxSize: CGSize)

    @discardableResult
    mutating func contentFittingSize(within maxSize: CGSize) -> CGSize
}
