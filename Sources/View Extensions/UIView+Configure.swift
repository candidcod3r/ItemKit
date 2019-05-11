//
//  UIView+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Configurable: class {
    associatedtype ItemType

    func configure(with item: ItemType?)
}

extension UIView: Configurable {
    open func configure(with item: Itemable?) {
        guard let item = item else {
            return
        }
        
        self.itemID = item.id
    }
}
