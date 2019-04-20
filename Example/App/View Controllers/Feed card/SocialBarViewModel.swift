//
//  SocialBarViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class SocialBarViewModel {
    struct Constant {
        static let likeImage = UIImage(named: "like")
        static let commentImage = UIImage(named: "comment")
        static let shareImage = UIImage(named: "share")
    }

    private(set) var likeButtonItem: ButtonItem
    private(set) var commentButtonItem: ButtonItem
    private(set) var shareButtonItem: ButtonItem

    private(set) var item: ItemProtocol? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        likeButtonItem = ButtonItem(
            id: "likeButton",
            title: "Like",
            image: UIImage(named: "plus"), // TODO change the image
            font: UIFont.buttonTitle,
            sizeGuide: SizeGuide(width: .fill))

        commentButtonItem = ButtonItem(
            id: "commentButton",
            title: "Comment",
            image: UIImage(named: "plus"), // TODO change the image
            font: UIFont.buttonTitle,
            sizeGuide: SizeGuide(width: .fill))

        shareButtonItem = ButtonItem(
            id: "shareButton",
            title: "Share",
            image: UIImage(named: "plus"), // TODO change the image
            font: UIFont.buttonTitle,
            sizeGuide: SizeGuide(width: .fill))

        let stackItem = StackItem(
            axis: .horizontal,
            distribution: .fillExtraSpaceEqually,
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fill),
            subItems: [likeButtonItem, commentButtonItem, shareButtonItem])

        self.item = stackItem
        self.itemCache = item?.createCache()
    }
}
