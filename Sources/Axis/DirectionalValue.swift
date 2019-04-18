//
//  DirectionalValue.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

protocol DirectionalValue {
    associatedtype ValueType
    var horizontal: ValueType { get set }
    var vertical: ValueType { get set }

    init(axisValue: ValueType, crossValue: ValueType, axis: Axis)
}

extension DirectionalValue {
    func value(along axis: Axis) -> ValueType {
        switch axis {
        case .horizontal:
            return horizontal
        case .vertical:
            return vertical
        }
    }

    func value(across axis: Axis) -> ValueType {
        switch axis {
        case .horizontal:
            return vertical
        case .vertical:
            return horizontal
        }
    }

    mutating func set(value: ValueType, along axis: Axis) {
        switch axis {
        case .horizontal:
            horizontal = value
        case .vertical:
            vertical = value
        }
    }

    mutating func set(value: ValueType, across axis: Axis) {
        switch axis {
        case .horizontal:
            vertical = value
        case .vertical:
            horizontal = value
        }
    }
}

extension CGSize: DirectionalValue {
    var horizontal: CGFloat {
        get {
            return width
        }
        set {
            width = newValue
        }
    }

    var vertical: CGFloat {
        get {
            return height
        }
        set {
            height = newValue
        }
    }

    init(axisValue: CGFloat, crossValue: CGFloat, axis: Axis) {
        switch axis {
        case .horizontal:
            self.init(width: axisValue, height: crossValue)
        case .vertical:
            self.init(width: crossValue, height: axisValue)
        }
    }
}

extension CGPoint: DirectionalValue {
    var horizontal: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }

    var vertical: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }

    init(axisValue: CGFloat, crossValue: CGFloat, axis: Axis) {
        switch axis {
        case .horizontal:
            self.init(x: axisValue, y: crossValue)
        case .vertical:
            self.init(x: crossValue, y: axisValue)
        }
    }
}

extension Flexibility: DirectionalValue {
    init(axisValue: Flex, crossValue: Flex, axis: Axis) {
        switch axis {
        case .horizontal:
            self.init(axisValue, crossValue)
        case .vertical:
            self.init(crossValue, axisValue)
        }
    }
}
