//
//  TestViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 5/10/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TestItemViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing ViewItemable"
        view.backgroundColor = .white

        setup()
    }

    private func setup() {
        let containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerItem.view = {
            let containerView = UIView()
            containerView.clipsToBounds = false
            containerView.layer.masksToBounds = false
            containerView.backgroundColor = UIColor(hex: 0xE9E9E9)
            return containerView
        }()

        let labelItem = LabelViewItem(
            id: "label",
            text: "This is a statement",
            font: UIFont.helveticaLight(of: 13),
            numberOfLines: 0,
            textContainerInsets: .zero,
            lineFragmentPadding: 0,
            alignment: .leadingTop)
        labelItem.view = {
            let label = UILabel()
            label.textColor = .black
            label.backgroundColor = UIColor(hex: 0xFFD444)
            return label
        }()
        containerItem.subItems.append(labelItem)

        let textViewItem = TextViewItem(
            id: "textView",
            text: "The U.S. 🇺🇸 is a country of 50 states covering a vast swath of North America, with Alaska in the northwest and Hawaii extending the nation’s presence into the Pacific Ocean.",
            font: UIFont.helveticaLight(of: 13),
            numberOfLines: 3,
            textContainerInsets: .zero,
            lineFragmentPadding: 8,
            alignment: .center)
        textViewItem.view = {
            let textView = UITextView()
            textView.textColor = .black
            textView.backgroundColor = UIColor(hex: 0xD8ED9C)
            return textView
        }()
        containerItem.subItems.append(textViewItem)

        let buttonItem = ButtonViewItem(
            id: "button",
            title: NSAttributedString(
                string: "View Profile",
                attributes: [NSAttributedString.Key.font : UIFont.helvetica(of: 13)]),
            image: UIImage(named: "profile_color"),
            font: UIFont.buttonTitle,
            contentInsets: UIEdgeInsets(8),
            titleInsets: UIEdgeInsets(left: 8),
            alignment: .centerBottom)
        buttonItem.view = {
            let button = UIButton()
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 4
            button.layer.masksToBounds = true
            return button
        }()
        containerItem.subItems.append(buttonItem)

        let containerParentWidth = CGFloat(360)
        let containerParentHeight = CGFloat(680)
        var containerParentItem = ViewItem(
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            insets: UIEdgeInsets(8),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.configureView()
        containerParentItem.layoutViews(within: view)
        print(containerParentItem.debugDescription())
    }
}
