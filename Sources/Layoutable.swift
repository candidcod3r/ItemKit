//
//  Layoutable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Layoutable {
    var frame: CGRect { get set }
    
    mutating func updateLayout(within maxFrame: CGRect)

    mutating func updateContentLayout(within maxFrame: CGRect)
}
