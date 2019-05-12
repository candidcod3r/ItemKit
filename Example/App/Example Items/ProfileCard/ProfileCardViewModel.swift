//
//  ProfileCardViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/22/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class ProfileCardViewModel {
    private(set) var backgroundImageItem: Item
    private(set) var actionButtonItem: ButtonItem
    private(set) var titleItem: LabelItem
    private(set) var headlineItem: LabelItem
    private(set) var subtitleItem: LabelItem
    private(set) var profileImageItem: Item
    private(set) var presenceItem: Item

    private(set) var item: Itemable? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        backgroundImageItem = Item(
            id: "backgroundImage",
            sizeGuide: SizeGuide(width: .fill, height: .fixed(76)))

        actionButtonItem = ButtonItem(
            id: "actionButton",
            title: "follow",
            insets: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4),
            alignment: .trailingTop)

        titleItem = LabelItem(
            id: "title",
            text: "Candid Cod3r",
            numberOfLines: 1,
            sizeGuide: SizeGuide(width: .fill))

        headlineItem = LabelItem(
            id: "headline",
            text: "Make world a better place",
            numberOfLines: 1,
            sizeGuide: SizeGuide(width: .fill))

        subtitleItem = LabelItem(
            id: "subtitle",
            text: "500+ connections",
            numberOfLines: 1,
            sizeGuide: SizeGuide(width: .fill))

        profileImageItem = Item(
            id: "profileImage",
            sizeGuide: SizeGuide(width: .fill, height: .fill))

        presenceItem = Item(
            id: "presence",
            sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(10)),
            alignment: .trailingBottom)

        let profileImageContainerItem = Item(
            sizeGuide: SizeGuide(width: .fixed(60), height: .fixed(60)),
            alignment: Alignment(
                horizontal: .leading,
                vertical: .top,
                offset: UIOffset(horizontal: 8, vertical: 76 - 30)),
            subItems: [profileImageItem, presenceItem])

        let textStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [
                titleItem,
                headlineItem,
                subtitleItem])

        let bottomStackItem = StackItem(
            axis: .vertical,
            spacing: 20,
            sizeGuide: SizeGuide(width: .fill),
            insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
            subItems: [
                actionButtonItem,
                textStackItem])

        let stackItem = StackItem(
            axis: .vertical,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [backgroundImageItem, bottomStackItem])

        item = CanvasItem(
            sizeGuide: SizeGuide(width: .fill),
            primaryItem: stackItem,
            subItems: [profileImageContainerItem])
    }
    
}
