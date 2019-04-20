//
//  TextItemViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/16/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TextItemViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    private let label1: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(hex: 0xFFD4D4)
        return label
    }()

    private let textView1: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = UIColor(hex: 0xD8EDFF)
        return textView
    }()

    private let label2: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(hex: 0xFFCF85)
        return label
    }()

    private let textView2: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.backgroundColor = UIColor(hex: 0xC4F8BD)
        return textView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing TextItem"
        view.backgroundColor = .white

        view.addSubview(containerView)
        containerView.addSubview(label1)
        containerView.addSubview(textView1)
        containerView.addSubview(label2)
        containerView.addSubview(textView2)

        setup()
    }

    private func setup() {
        var containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(withItem: containerItem)

        let label1Item = TextItem(
            id: "label1",
            text: "This is a statement",
            font: UIFont.helveticaLight(of: 13),
            numberOfLines: 0,
            textContainerInsets: .zero,
            lineFragmentPadding: 0,
            alignment: .leadingTop)
        containerItem.subItems.append(label1Item)
        label1.configure(withTextItem: label1Item)

        let textView1Item = TextItem(
            id: "textView1",
            text: "The U.S. 🇺🇸 is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean.",
            font: UIFont.helveticaLight(of: 13),
            numberOfLines: 3,
            textContainerInsets: .zero,
            lineFragmentPadding: 8,
            alignment: .trailingTop)

        let textView1ParentItem = Item(
            insets: UIEdgeInsets(top: 32),
            alignment: .trailingTop,
            subItems: [textView1Item])
        containerItem.subItems.append(textView1ParentItem)
        textView1.configure(withTextItem: textView1Item)

        let textView2Item = TextItem(
            id: "textView2",
            text: "The Great Smoky Mountains ⛰️ are a mountain range rising along the Tennessee–North Carolina border in the southeastern United States. They are a subrange of the Appalachian Mountains, and form part of the Blue Ridge Physiographic Province.",
            font: UIFont.helveticaLight(of: 15),
            numberOfLines: 3,
            textContainerInsets: UIEdgeInsets(8),
            lineFragmentPadding: 0,
            alignment: .center)
        containerItem.subItems.append(textView2Item)
        textView2.configure(withTextItem: textView2Item)

        let label2Item = TextItem(
            id: "label2",
            text: "Sachin Ramesh Tendulkar is a former Indian international cricketer 🏏 and a former captain of the Indian national team, regarded as one of the greatest batsmen of all time. He is the highest run scorer of all time in International cricket.",
            font: UIFont.helveticaLight(of: 15),
            numberOfLines: 2,
            textContainerInsets: .zero,
            lineFragmentPadding: 0,
            alignment: .centerBottom)
        containerItem.subItems.append(label2Item)
        label2.configure(withTextItem: label2Item)

        let containerParentWidth = CGFloat(360)
        let containerParentHeight = CGFloat(680)
        var containerParentItem = Item(
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.updateLayout(within: view.bounds)
        print(containerParentItem.debugDescription())

        containerView.updateLayout(with: containerParentItem)
    }
}
