//
//  DirectionalValue.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol DirectionalValue {
    associatedtype ValueType
    var horizontal: ValueType { get set }
    var vertical: ValueType { get set }
}

extension DirectionalValue {
    public func value(along axis: Axis) -> ValueType {
        switch axis {
        case .horizontal:
            return horizontal
        case .vertical:
            return vertical
        }
    }

    public func value(across axis: Axis) -> ValueType {
        switch axis {
        case .horizontal:
            return vertical
        case .vertical:
            return horizontal
        }
    }

    public mutating func setValue(value: ValueType, along axis: Axis) {
        switch axis {
        case .horizontal:
            horizontal = value
        case .vertical:
            vertical = value
        }
    }

    public mutating func setValue(value: ValueType, across axis: Axis) {
        switch axis {
        case .horizontal:
            vertical = value
        case .vertical:
            horizontal = value
        }
    }
}

extension CGSize: DirectionalValue {
    public var horizontal: CGFloat {
        get {
            return width
        }
        set {
            width = newValue
        }
    }

    public var vertical: CGFloat {
        get {
            return height
        }
        set {
            height = newValue
        }
    }
}

extension CGPoint: DirectionalValue {
    public var horizontal: CGFloat {
        get {
            return x
        }
        set {
            x = newValue
        }
    }

    public var vertical: CGFloat {
        get {
            return y
        }
        set {
            y = newValue
        }
    }
}

extension Flexibility: DirectionalValue {
}
