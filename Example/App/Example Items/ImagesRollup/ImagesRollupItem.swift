//
//  ImagesRollupItem.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/21/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

public class ImagesRollupItem: StackItem {
    struct Constant {
        static let subItemIDPrefix = "rollupItem"
    }

    // MARK:- Designated intializer
    public init(id: String,
                imagesCount: Int,
                imageSize: CGSize,
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop) {
        let subItemSizeGuide = SizeGuide(
            width: .fixed(imageSize.width),
            height: .fixed(imageSize.height))
        let imageItems: [Itemable] = (imagesCount <= 0)
            ? []
            : (0..<imagesCount).map { (index) in
                return Item(
                    id: Constant.subItemIDPrefix + "\(index)",
                    sizeGuide: subItemSizeGuide)}

        super.init(
            id: id,
            spacing: -imageSize.width/2,
            sizeGuide: SizeGuide(width: .fit, height: .fit),
            insets: insets,
            alignment: alignment,
            flexibility: Flexibility.low,
            subItems: imageItems)
    }
}
