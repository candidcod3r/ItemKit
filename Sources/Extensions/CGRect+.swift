//
//  CGRect+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGRect {

    var width: CGFloat {
        get {
            return size.width
        }
        set {
            size.width = newValue
        }
    }

    var height: CGFloat {
        get {
            return size.height
        }
        set {
            size.height = newValue
        }
    }

    var top: CGFloat {
        get {
            return origin.y
        }
        set {
            origin.y = newValue
        }
    }

    var left: CGFloat {
        get {
            return origin.x
        }
        set {
            origin.x = newValue
        }
    }

    var bottom: CGFloat {
        get {
            return top + height
        }
        set {
            top = newValue - height
        }
    }

    var right: CGFloat {
        get {
            return left + width
        }
        set {
            left = newValue - width
        }
    }

}
