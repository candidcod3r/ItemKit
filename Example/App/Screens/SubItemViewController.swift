//
//  SubItemViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/21/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class SubItemViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "golden_gate")
        return imageView
    }()

    private let overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xAF262626)
        return view
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing BackgroundItem"
        view.backgroundColor = .white
        view.clipsToBounds = false

        view.addSubview(containerView)
        containerView.addSubview(backgroundImageView)
        containerView.addSubview(overlayView)
        overlayView.addSubview(titleLabel)

        setup()
    }

    private func setup() {
        let containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(with: containerItem)

        let canvasItem = Item(
            sizeGuide: SizeGuide(width: .fill, height: .fixed(200)),
            alignment: .center)
        containerItem.subItems.append(canvasItem)

        let imageViewItem = Item(
            id: "imageView",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        backgroundImageView.configure(with: imageViewItem)
        canvasItem.subItems.append(imageViewItem)

        let overlayItem = Item(
            id: "overlay",
            sizeGuide: SizeGuide(width: .fill, height: .percent(0.40)),
            alignment: .leadingBottom)
        overlayView.configure(with: overlayItem)
        canvasItem.subItems.append(overlayItem)

        let titleLabelItem = LabelItem(
            id: "titleLabel",
            text: "Make world a better place",
            font: UIFont.helvetica(of: 22),
            alignment: .center)
        titleLabel.configure(with: titleLabelItem)
        overlayItem.subItems.append(titleLabelItem)

        let containerParentWidth = CGFloat(360)
        let containerParentHeight = CGFloat(680)
        let containerParentItem = Item(
            sizeGuide: SizeGuide(width: .fixed(containerParentWidth), height: .fixed(containerParentHeight)),
            insets: UIEdgeInsets(8),
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
