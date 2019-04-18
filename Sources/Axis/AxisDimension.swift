//
//  AxisDimension.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct AxisDimension<DimensionType: DirectionalValue> {
    var axis: Axis
    var dimension: DimensionType

    var axisValue: DimensionType.ValueType {
        get {
            return dimension.value(along: axis)
        }
        set {
            dimension.set(value: newValue, along: axis)
        }
    }

    var crossValue: DimensionType.ValueType {
        get {
            return dimension.value(across: axis)
        }
        set {
            dimension.set(value: newValue, across: axis)
        }
    }

    init(axis: Axis, dimension: DimensionType) {
        self.axis = axis
        self.dimension = dimension
    }
}
