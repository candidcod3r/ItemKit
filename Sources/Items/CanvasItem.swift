//
//  CanvasItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/21/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class CanvasItem: Item {
    open override func contentFittingSize(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
        }
        return Sizer.fittingSize(within: maxSize, using: sizeGuide)
    }
}
