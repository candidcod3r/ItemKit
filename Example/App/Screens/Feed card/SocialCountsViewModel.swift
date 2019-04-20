//
//  SocialCountsViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class SocialCountsViewModel {
    struct Constant {
        static let countsFont = UIFont.helveticaLight(of: 13)
    }

    private(set) var likesCountItem: TextItem
    private(set) var dotItem: TextItem
    private(set) var commentsCountItem: TextItem

    private(set) var item: ItemProtocol? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        likesCountItem = TextItem(
            id: "likesCount",
            text: "1200 Likes",
            font: Constant.countsFont)

        dotItem = TextItem(
            id: "dot",
            text: " • ",
            font: Constant.countsFont)

        commentsCountItem = TextItem(
            id: "commentsCount",
            text: "300 Comments",
            font: Constant.countsFont)

        let stackItem = StackItem(
            axis: .horizontal,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [likesCountItem, dotItem, commentsCountItem])

        self.item = stackItem
        self.itemCache = item?.createCache()
    }
}
