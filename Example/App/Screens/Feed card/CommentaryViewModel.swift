//
//  CommentaryViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class CommentaryViewModel {

    struct Constant {
        static let textFont = UIFont.helvetica(of: 15)
        static let mentionFont = UIFont.helveticaMedium(of: 15)

        static let hashTagAttributes = [NSAttributedString.Key.font: textFont,
                                        NSAttributedString.Key.foregroundColor: UIColor(hex: 0x0077CB)]

        static let textAttributes = [NSAttributedString.Key.font: textFont,
                                     NSAttributedString.Key.foregroundColor: UIColor.black]

        static let mentionAttributes = [NSAttributedString.Key.font: mentionFont,
                                        NSAttributedString.Key.foregroundColor: UIColor.black]
    }

    private(set) var textItem: TextItem

    private(set) var item: Itemable? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        textItem = TextItem(
            id: "commentaryText",
            text: CommentaryViewModel.creteText(),
            sizeGuide: SizeGuide(width: .fill))

        let stackItem = StackItem(
            axis: .vertical,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [textItem])

        self.item = stackItem
        self.itemCache = item?.createCache()
    }

    static func creteText() -> NSAttributedString {
        let text = NSMutableAttributedString()
        text.append(
            NSAttributedString(
                string: "Sachin Ramesh Tendulkar",
                attributes: Constant.mentionAttributes))

        text.append(
            NSAttributedString(
                string: " is a former Indian international cricketer and a former captain of the Indian national ",
                attributes: Constant.textAttributes))

        text.append(
            NSAttributedString(
                string: "#team",
                attributes: Constant.hashTagAttributes))

        text.append(
            NSAttributedString(
                string: ", regarded as one of the greatest batsmen of all time. He is the highest run ",
                attributes: Constant.textAttributes))

        text.append(
            NSAttributedString(
                string: "#scorer",
                attributes: Constant.hashTagAttributes))

        text.append(
            NSAttributedString(
                string: " of all time in International cricket 🏏.",
                attributes: Constant.textAttributes))

        return text
    }

}
