//
//  SocialCountsViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class SocialCountsViewModel {
    private(set) var likesCountItem: TextItem
    private(set) var dotItem: TextItem
    private(set) var commentsCountItem: TextItem

    private(set) var item: ItemProtocol? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        likesCountItem = TextItem(
            id: "likesCount",
            text: "1200 Likes",
            font: UIFont.helvetica(of: 12))

        dotItem = TextItem(
            id: "dot",
            text: " • ",
            font: UIFont.helvetica(of: 12))

        commentsCountItem = TextItem(
            id: "commentsCount",
            text: "300 Comments",
            font: UIFont.helvetica(of: 12))

        let stackItem = StackItem(
            axis: .horizontal,
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fill))

        self.item = stackItem
        self.itemCache = item?.createCache()
    }
}
