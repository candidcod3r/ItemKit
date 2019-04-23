//
//  CanvasItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/22/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class CanvasItem: Item {
    open var primaryItem: Itemable

    public init(id: String? = nil,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                primaryItem: Itemable,
                subItems: [Itemable] = []) {
        self.primaryItem = primaryItem
        let subItems = [primaryItem] + subItems
        super.init(
            id: id,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            subItems: subItems)
    }

    open override func contentFittingSize(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
        }
        return Sizer.fittingSize(within: primaryItem.fittingSize, using: sizeGuide)
    }
}
