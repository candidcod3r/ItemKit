//
//  UIView+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIView {
    open func configure(withItem item: Itemable?) {
        guard let item = item else {
            return
        }
        
        self.itemID = item.id
    }
}
