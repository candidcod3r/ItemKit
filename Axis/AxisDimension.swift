//
//  AxisDimension.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct AxisDimension<DimensionType: DirectionalValue> {
    public var axis: Axis
    public var dimension: DimensionType

    public var axisValue: DimensionType.ValueType {
        get {
            return dimension.value(along: axis)
        }
        set {
            dimension.setValue(value: newValue, along: axis)
        }
    }

    public var crossValue: DimensionType.ValueType {
        get {
            return dimension.value(across: axis)
        }
        set {
            dimension.setValue(value: newValue, across: axis)
        }
    }

    public init(axis: Axis, dimension: DimensionType) {
        self.axis = axis
        self.dimension = dimension
    }
}
