//
//  UIView+Debug.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

private var itemKitIDKey: UInt8 = 0

extension UIView {

    public internal(set) var itemKitID: String? {
        get {
            return objc_getAssociatedObject(self, &itemKitIDKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &itemKitIDKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }

    func setBorders(with color: UIColor?, recursively: Bool = true) {
        let nonnilColor = color ?? .random
        layer.borderColor = nonnilColor.cgColor
        layer.borderWidth = 1

        guard recursively else {
            return
        }

        for subview in subviews {
            subview.setBorders(with: color, recursively: recursively)
        }
    }

}
