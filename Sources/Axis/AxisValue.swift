//
//  AxisValue.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct AxisValue<ValueType: DirectionalValue> {
    let axis: Axis
    private(set) var value: ValueType

    var axisValue: ValueType.ValueType {
        get {
            return value.value(along: axis)
        }
        set {
            value.set(value: newValue, along: axis)
        }
    }

    var crossValue: ValueType.ValueType {
        get {
            return value.value(across: axis)
        }
        set {
            value.set(value: newValue, across: axis)
        }
    }

    init(axis: Axis, value: ValueType) {
        self.axis = axis
        self.value = value
    }
}

typealias AxisSize = AxisValue<CGSize>
typealias AxisPoint = AxisValue<CGPoint>
typealias AxisFlexibility = AxisValue<Flexibility>
