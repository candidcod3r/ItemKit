//
//  TestStackItemViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TestStackItemViewController: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(hex: 0xD8EDFF)
        return label
    }()

    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.backgroundColor = UIColor(hex: 0xFFCF85)
        return label
    }()

    let connectButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing fixed size guide"
        view.backgroundColor = .white
        view.clipsToBounds = false

        view.addSubview(containerView)
        containerView.addSubview(actorImageView)
        containerView.addSubview(titleLabel)
        containerView.addSubview(subtitleLabel)
        containerView.addSubview(connectButton)

        setup()
    }

    func setup() {
        var containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(withItem: containerItem)

        let imageViewItem = Item(
            id: "imageView",
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(40)),
            alignment: .leadingCenter)
        actorImageView.image = UIImage(named: "user")
        actorImageView.configure(withItem: imageViewItem)

        let titleLabelItem = TextItem(
            id: "titleLabel",
            text: "Candid Cod3r",
            font: UIFont.helveticaLight(of: 15),
            sizeGuide: SizeGuide(width: .fill),
            alignment: .leadingCenter)
        titleLabel.configure(withTextItem: titleLabelItem)

        let subtitleLabelItem = TextItem(
            id: "subtitleLabel",
            text: "Make world a better place",
            font: UIFont.helveticaLight(of: 13),
            sizeGuide: SizeGuide(width: .fill),
            alignment: .leadingCenter)
        subtitleLabel.configure(withTextItem: subtitleLabelItem)

        let connectButtonItem = ButtonItem(
            id: "connectButton",
            title: "Connect",
            image: UIImage(named: "plus"),
            font: UIFont.buttonTitle,
            alignment: .trailingCenter)
        connectButton.configure(withButtonItem: connectButtonItem)

        let titlesStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            distribution: .leading,
            sizeGuide: SizeGuide(width: .fill),
            alignment: .leadingCenter,
            flexibility: .high,
            subItems: [titleLabelItem, subtitleLabelItem])

        let rightStackItem = StackItem(
            axis: .horizontal,
            spacing: 4,
            distribution: .fillExtraSpace,
            sizeGuide: SizeGuide(width: .fill),
            alignment: .leadingCenter,
            subItems: [titlesStackItem, connectButtonItem])

        let stackItem = StackItem(
            axis: .horizontal,
            spacing: 8,
            distribution: .fillExtraSpace,
            sizeGuide: SizeGuide(width: .fill),
            alignment: .leadingCenter,
            subItems: [imageViewItem, rightStackItem])
        containerItem.subItems.append(stackItem)

        let containerParentWidth = CGFloat(360)
        let containerParentHeight = CGFloat(680)
        var containerParentItem = Item(
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        let viewBounds = self.view.bounds
        DispatchQueue.global(qos: .background).async {
            containerParentItem.updateLayout(within: viewBounds)
            print(containerParentItem.debugDescription())

            DispatchQueue.main.async {
                self.containerView.updateLayout(with: containerParentItem)
                self.view.setBorders()
            }
        }
    }

}