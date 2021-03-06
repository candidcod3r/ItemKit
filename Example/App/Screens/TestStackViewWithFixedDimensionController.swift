//
//  TestStackViewWithFixedDimensionController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 5/12/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TestStackViewWithFixedDimensionController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Test StackView with fixed dimension"
        view.backgroundColor = .white

        setup()
    }

    private func setup() {
        let textViewItem = TextViewItem(
            text: "This is an awesome statement.",
            font: UIFont.helveticaLight(of: 13),
            numberOfLines: 3,
            textContainerInsets: .zero,
            lineFragmentPadding: 8,
            sizeGuide: SizeGuide(width: .fill, height: .fixed(100)),
            alignment: .center)

        textViewItem.configureView = { (textView) in
            textView.textColor = .black
            textView.backgroundColor = UIColor(hex: 0xD8ED9C)
        }

        let buttonItem = ButtonViewItem(
            title: NSAttributedString(
                string: "View Profile",
                attributes: [NSAttributedString.Key.font : UIFont.helvetica(of: 13)]),
            image: UIImage(named: "profile_color"),
            font: UIFont.buttonTitle,
            contentInsets: UIEdgeInsets(8),
            titleInsets: UIEdgeInsets(left: 8),
            alignment: .centerBottom)

        buttonItem.configureView = { (button) in
            button.backgroundColor = .lightGray
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 4
            button.layer.masksToBounds = true
        }

        let containerItem = StackViewItem(
            id: "containerItem",
            axis: .vertical,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [textViewItem, buttonItem])

        containerItem.configureView = { (view) in
            view.clipsToBounds = false
            view.layer.masksToBounds = false
            view.backgroundColor = UIColor(hex: 0xE9E9E9)
        }

        let containerParentWidth = CGFloat(360)
        let containerParentHeight = CGFloat(680)
        var containerParentItem = ViewItem<UIView>(
            id: "containerParentItem",
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            insets: UIEdgeInsets(8),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.configureView = { (view) in
            view.layer.borderColor = UIColor.darkGray.cgColor
            view.layer.borderWidth = 1
        }

        containerParentItem.layoutViews(within: view)
        print(containerParentItem.debugDescription())
    }
}
