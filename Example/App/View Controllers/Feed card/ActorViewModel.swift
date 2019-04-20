//
//  ActorViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class ActorViewModel {
    struct Constant {
        static let image = UIImage(named: "user_color")
    }

    private(set) var image = Constant.image
    private(set) var imageItem: Item
    private(set) var titleItem: TextItem
    private(set) var subtitleItem: TextItem
    private(set) var actionButtonItem: ButtonItem

    private(set) var item: ItemProtocol? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        imageItem = Item(
            id: "imageItem",
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(40)),
            alignment: .leadingCenter)

        titleItem = TextItem(
            id: "titleItem",
            text: ActorViewModel.titleText(),
            font: UIFont.helveticaLight(of: 15),
            sizeGuide: SizeGuide(width: .fill))

        subtitleItem = TextItem(
            id: "subtitleItem",
            text: "Make world a better place",
            font: UIFont.helveticaLight(of: 15),
            sizeGuide: SizeGuide(width: .fill))

        actionButtonItem = ButtonItem(
            id: "actionButton",
            title: "Connect",
            image: UIImage(named: "plus"),
            font: UIFont.buttonTitle,
            alignment: .trailingCenter)

        let labelsStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            sizeGuide: SizeGuide(width: .fill),
            flexibility: .high)

        let stackItem = StackItem(
            axis: .horizontal,
            spacing: 8,
            distribution: .fillExtraSpace,
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fill),
            subItems: [imageItem, labelsStackItem, actionButtonItem])

        self.item = stackItem
        self.itemCache = item?.createCache()
    }

    static func titleText() -> NSAttributedString {
        let title = NSMutableAttributedString(
            string: "Candid Cod3r",
            attributes: [NSAttributedString.Key.font : UIFont.helveticaLight(of: 15)])

        let degree = NSAttributedString(
            string: "1st",
            attributes: [NSAttributedString.Key.font : UIFont.helveticaLight(of: 13),
                         NSAttributedString.Key.foregroundColor : UIColor.lightGray])

        title.append(degree)
        return title
    }
}
