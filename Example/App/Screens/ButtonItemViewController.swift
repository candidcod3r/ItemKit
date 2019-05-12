//
//  ButtonItemViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/17/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class ButtonItemViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    private static func createButton() -> UIButton {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(.black, for: .normal)
        return button
    }

    private let button1: UIButton = {
        return createButton()
    }()

    private let button2: UIButton = {
        return createButton()
    }()

    private let button3: UIButton = {
        return createButton()
    }()

    private let button4: UIButton = {
        return createButton()
    }()

    private let button5: UIButton = {
        return createButton()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing ButtonItem"
        view.backgroundColor = .white

        view.addSubview(containerView)
        containerView.addSubview(button1)
        containerView.addSubview(button2)
        containerView.addSubview(button3)
        containerView.addSubview(button4)
        containerView.addSubview(button5)

        setup()
        view.setBorders()
    }

    func setup() {
        let containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(with: containerItem)

        let button1Item = ButtonViewItem(
            id: "button1",
            title: "Click this",
            font: UIFont.helveticaMedium(of: 15),
            alignment: .centerTop)
        containerItem.subItems.append(button1Item)
        button1.configure(with: button1Item)

        let button2Item = ButtonViewItem(
            id: "button2",
            title: "Person",
            image: UIImage(named: "user_color"),
            contentInsets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fit, height: .fit),
            alignment: .trailingCenter)
        containerItem.subItems.append(button2Item)
        button2.configure(with: button2Item)

        let button3Item = ButtonViewItem(
            id: "button3",
            title: "Great going!!",
            font: UIFont.helvetica(of: 15),
            contentInsets: UIEdgeInsets(8),
            alignment: .center)
        containerItem.subItems.append(button3Item)
        button3.configure(with: button3Item)

        let button4Item = ButtonViewItem(
            id: "button4",
            title: NSAttributedString(
                string: "View Profile",
                attributes: [NSAttributedString.Key.font : UIFont.helvetica(of: 13)]),
            image: UIImage(named: "profile_color"),
            font: UIFont.buttonTitle,
            titleInsets: UIEdgeInsets(left: 8),
            alignment: .leadingBottom)
        containerItem.subItems.append(button4Item)
        button4.configure(with: button4Item)

        let button5Item = ButtonViewItem(
            id: "button5",
            title: "Connect",
            image: UIImage(named: "plus"),
            font: UIFont.buttonTitle,
            imageInsets: UIEdgeInsets(right: 8),
            alignment: .trailingBottom)
        containerItem.subItems.append(button5Item)
        button5.configure(with: button5Item)

        let containerParentWidth: CGFloat = 360
        let containerParentHeight: CGFloat = 400
        let containerParentItem = Item(
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            insets: UIEdgeInsets(8),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.updateLayout(within: view.bounds)
        print(containerParentItem.debugDescription())

        containerView.updateLayout(with: containerParentItem)
    }
}
