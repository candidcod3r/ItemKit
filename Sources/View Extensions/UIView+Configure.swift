//
//  UIView+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIView {
    public func configure(withItem item: ItemProtocol) {
        self.itemID = item.id
    }
}
