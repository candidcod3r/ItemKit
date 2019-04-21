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
        static let likeImage = UIImage(named: "heart_circle")
        static let commentImage = UIImage(named: "comment_circle")
        static let shareImage = UIImage(named: "share_circle")
    }

    private(set) var likeButtonItem: ButtonItem
    private(set) var commentButtonItem: ButtonItem
    private(set) var shareButtonItem: ButtonItem

    private(set) var item: Itemable? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        likeButtonItem = ButtonItem(
            id: "likeButton",
            title: "Like",
            image: Constant.likeImage,
            font: UIFont.buttonTitle,
            titleInsets: UIEdgeInsets(left: 8),
            sizeGuide: SizeGuide(width: .fill))

        commentButtonItem = ButtonItem(
            id: "commentButton",
            title: "Comment",
            image: Constant.commentImage,
            font: UIFont.buttonTitle,
            titleInsets: UIEdgeInsets(left: 16),
            sizeGuide: SizeGuide(width: .fill))

        shareButtonItem = ButtonItem(
            id: "shareButton",
            title: "Share",
            image: Constant.shareImage,
            font: UIFont.buttonTitle,
            imageInsets: UIEdgeInsets(right: 8),
            sizeGuide: SizeGuide(width: .fill))

        let stackItem = StackItem(
            axis: .horizontal,
            distribution: .fillExtraSpaceEqually,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [likeButtonItem, commentButtonItem, shareButtonItem])

        self.item = stackItem
        self.itemCache = item?.createCache()
    }
}
