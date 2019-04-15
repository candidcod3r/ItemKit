//
//  Measurable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public protocol Measurable {
    mutating func updateMeasurements(within maxSize: CGSize)

    @discardableResult
    mutating func updateContentMeasurements(within maxSize: CGSize) -> CGSize
}
