//
//  UIEdgeInsets+.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/16/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

extension UIEdgeInsets {
    init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    init(_ value: CGFloat) {
        self.init(horizontal: value, vertical: value)
    }
}
