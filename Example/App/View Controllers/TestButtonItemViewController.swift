//
//  TestButtonItemViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/17/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TestButtonItemViewController: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    static func createButton() -> UIButton {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(.black, for: .normal)
        return button
    }

    let button1: UIButton = {
        return createButton()
    }()

    let button2: UIButton = {
        return createButton()
    }()

    let button3: UIButton = {
        return createButton()
    }()

    let button4: UIButton = {
        return createButton()
    }()

    let button5: UIButton = {
        return createButton()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing fixed size guide"
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
        var containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(withItem: containerItem)

        let button1Item = ButtonItem(
            id: "button1",
            title: "Click this",
            font: UIFont.helveticaMedium(of: 15),
            alignment: .centerTop)
        containerItem.subItems.append(button1Item)
        button1.configure(withButtonItem: button1Item)

        let button2Item = ButtonItem(
            id: "button2",
            title: "Person",
            image: UIImage(named: "user"),
            contentInsets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fit, height: .fit),
            alignment: .trailingCenter)
        containerItem.subItems.append(button2Item)
        button2.configure(withButtonItem: button2Item)

        let button3Item = ButtonItem(
            id: "button3",
            title: "Great going!!",
            font: UIFont.helvetica(of: 15),
            contentInsets: UIEdgeInsets(8),
            alignment: .center)
        containerItem.subItems.append(button3Item)
        button3.configure(withButtonItem: button3Item)

        let button4Item = ButtonItem(
            id: "button4",
            title: NSAttributedString(
                string: "View Profile",
                attributes: [NSAttributedString.Key.font : UIFont.helvetica(of: 13)]),
            image: UIImage(named: "profile"),
            font: UIFont.buttonTitle,
            titleInsets: UIEdgeInsets(left: 8),
            alignment: .leadingBottom)
        containerItem.subItems.append(button4Item)
        button4.configure(withButtonItem: button4Item)

        let button5Item = ButtonItem(
            id: "button5",
            title: "Connect",
            image: UIImage(named: "plus"),
            font: UIFont.buttonTitle,
            imageInsets: UIEdgeInsets(right: 8),
            alignment: .trailingBottom)
        containerItem.subItems.append(button5Item)
        button5.configure(withButtonItem: button5Item)

        let containerParentWidth: CGFloat = 360
        let containerParentHeight: CGFloat = 400
        var containerParentItem = Item(
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.updateLayouts(within: view.bounds)
        print(containerParentItem.debugDescription())

        containerView.updateLayouts(with: containerParentItem)
    }

}