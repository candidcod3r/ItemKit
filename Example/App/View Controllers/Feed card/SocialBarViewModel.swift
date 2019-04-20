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
        static let likeImage = UIImage(named: "like")?.withRenderingMode(.alwaysTemplate).resized(toWidth: 32)
        static let commentImage = UIImage(named: "comment")?.withRenderingMode(.alwaysTemplate).resized(toWidth: 32)
        static let shareImage = UIImage(named: "share")?.withRenderingMode(.alwaysTemplate).resized(toWidth: 32)
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
            image: Constant.likeImage,
            font: UIFont.buttonTitle,
            sizeGuide: SizeGuide(width: .fill))

        commentButtonItem = ButtonItem(
            id: "commentButton",
            title: "Comment",
            image: Constant.commentImage,
            font: UIFont.buttonTitle,
            sizeGuide: SizeGuide(width: .fill))

        shareButtonItem = ButtonItem(
            id: "shareButton",
            title: "Share",
            image: Constant.shareImage,
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
