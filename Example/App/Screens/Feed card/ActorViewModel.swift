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
        static let actorImage = UIImage(named: "user_color")
        static let titleFont = UIFont.helveticaLight(of: 15)
        static let subtitleFont = UIFont.helveticaLight(of: 14)
        static let degreeFont = UIFont.helveticaLight(of: 13)
        static let plusImage = UIImage(named: "plus")?.resized(toWidth: 20).withRenderingMode(.alwaysTemplate)
    }

    private(set) var image = Constant.actorImage
    private(set) var imageItem: Item
    private(set) var titleItem: TextItem
    private(set) var subtitleItem: TextItem
    private(set) var actionButtonItem: ButtonItem

    private(set) var item: Itemable? = nil

    init() {
        imageItem = Item(
            id: "imageItem",
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(40)),
            alignment: .leadingCenter)

        titleItem = TextItem(
            id: "titleItem",
            text: ActorViewModel.titleText(),
            font: Constant.titleFont,
            sizeGuide: SizeGuide(width: .fill))

        subtitleItem = TextItem(
            id: "subtitleItem",
            text: "Make world a better place",
            font: Constant.subtitleFont,
            sizeGuide: SizeGuide(width: .fill))

        actionButtonItem = ButtonItem(
            id: "actionButton",
            title: "Connect",
            image: Constant.plusImage,
            font: UIFont.buttonTitle,
            contentInsets: UIEdgeInsets(6),
            alignment: .trailingCenter)

        let labelsStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            sizeGuide: SizeGuide(width: .fill),
            flexibility: .high,
            subItems: [titleItem, subtitleItem])

        let stackItem = StackItem(
            axis: .horizontal,
            spacing: 8,
            distribution: .fillExtraSpace,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [imageItem, labelsStackItem, actionButtonItem])

        self.item = stackItem
    }

    static func titleText() -> NSAttributedString {
        let title = NSMutableAttributedString()
        let name = NSAttributedString(
            string: "Candid Cod3r",
            attributes: [NSAttributedString.Key.font : Constant.titleFont])
        title.append(name)

        let degree = NSAttributedString(
            string: " 1st",
            attributes: [NSAttributedString.Key.font : Constant.degreeFont,
                         NSAttributedString.Key.foregroundColor : UIColor.gray])
        title.append(degree)

        return title
    }
}
