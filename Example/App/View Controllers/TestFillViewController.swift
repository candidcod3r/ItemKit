//
//  TestFillViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/15/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class TestFillViewController: UIViewController {

    let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    let cyanView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xFFCC00)
        return view
    }()

    let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing fixed size guide"
        view.backgroundColor = .white

        view.addSubview(containerView)
        containerView.addSubview(redView)
        containerView.addSubview(blueView)
        containerView.addSubview(cyanView)
        containerView.addSubview(yellowView)
        containerView.addSubview(orangeView)
        containerView.addSubview(greenView)

        setup()
    }

    func setup() {
        let containerWidth: CGFloat = 360
        let containerHeight: CGFloat = 400

        ///////////////////
        // containerView //
        ///////////////////
        var containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(containerItem)

        /////////////
        // redView //
        /////////////
        let redItem = Item(
            id: "redItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(40), height: .fill),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(redItem)
        redView.configure(redItem)

        //////////////
        // blueView //
        //////////////
        let blueItem = Item(
            id: "blueItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fixed(10)),
            alignment: .trailingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(blueItem)
        blueView.configure(blueItem)

        //////////////
        // cyanView //
        //////////////
        let cyanItem = Item(
            id: "cyanItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fixed(20)),
            alignment: .leadingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(cyanItem)
        cyanView.configure(cyanItem)

        ///////////////
        // greenView //
        ///////////////
        let greenItem = Item(
            id: "greenItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(50), height: .fill),
            alignment: .center,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(greenItem)
        greenView.configure(greenItem)

        ////////////////
        // yellowView //
        ////////////////
        let yellowItem = Item(
            id: "yellowItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(15), height: .fill),
            alignment: .trailingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(yellowItem)
        yellowView.configure(yellowItem)

        ////////////////
        // orangeView //
        ////////////////
        let orangeItem = Item(
            id: "orangeItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fixed(20)),
            alignment: .leadingCenter,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(orangeItem)
        orangeView.configure(orangeItem)

        /////////////////////////
        // containerParentItem //
        /////////////////////////
        var containerParentItem = Item(
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fixed(containerWidth), height: .fixed(containerHeight)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [containerItem])

        containerParentItem.updateLayouts(within: view.bounds)
        print(containerParentItem.debugDescription())

        containerView.updateLayouts(with: containerParentItem)
    }

}
