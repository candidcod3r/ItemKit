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

    private(set) var likesCountItem: LabelItem
    private(set) var dotItem: LabelItem
    private(set) var commentsCountItem: LabelItem

    private(set) var item: ViewItem? = nil

    init() {
        likesCountItem = LabelItem(
            id: "likesCount",
            text: "1200 Likes",
            font: Constant.countsFont)

        dotItem = LabelItem(
            id: "dot",
            text: " • ",
            font: Constant.countsFont)

        commentsCountItem = LabelItem(
            id: "commentsCount",
            text: "300 Comments",
            font: Constant.countsFont)

        let stackItem = StackItem(
            axis: .horizontal,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [likesCountItem, dotItem, commentsCountItem])

        self.item = stackItem
    }
}
