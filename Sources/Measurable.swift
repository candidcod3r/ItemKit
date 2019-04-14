//
//  Measurable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public protocol Measurable {
    func intrinsicSize(within maxSize: CGSize) -> CGSize

    func updateMeasurement(within maxSize: CGSize)
}
