//
//  FixedViewController.swift
//  ItemKit
//
//  Created by candidcod3r on 04/12/2019.
//  Copyright (c) 2019 candidcod3r.
//

import UIKit
import ItemKit

class FixedViewController: UIViewController {

    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = UIColor(hex: 0xE9E9E9)
        return view
    }()

    private let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()

    private let blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    private let cyanView: UIView = {
        let view = UIView()
        view.backgroundColor = .cyan
        return view
    }()

    private let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xFFCC00)
        return view
    }()

    private let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xC86EDF)
        return view
    }()

    private let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()

    private let lightGreenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x55EFCB)
        return view
    }()

    private let pinkView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xFF4981)
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
        containerView.addSubview(greenView)
        containerView.addSubview(yellowView)
        containerView.addSubview(purpleView)
        containerView.addSubview(orangeView)
        containerView.addSubview(lightGreenView)
        containerView.addSubview(pinkView)

        setup()
    }

    private func setup() {
        ///////////////////
        // containerView //
        ///////////////////
        let containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(with: containerItem)

        /////////////
        // redView //
        /////////////
        let redItem = Item(
            id: "redItem",
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(20)),
            insets: .zero,
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(redItem)
        redView.configure(with: redItem)

        //////////////
        // blueView //
        //////////////
        let blueItem = Item(
            id: "blueItem",
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(10)),
            insets: .zero,
            alignment: .trailingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(blueItem)
        blueView.configure(with: blueItem)

        //////////////
        // cyanView //
        //////////////
        let cyanItem = Item(
            id: "cyanItem",
            sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(20)),
            insets: .zero,
            alignment: .leadingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(cyanItem)
        cyanView.configure(with: cyanItem)

        ///////////////
        // greenView //
        ///////////////
        let greenItem = Item(
            id: "greenItem",
            sizeGuide: SizeGuide(width: .fixed(50), height: .fixed(50)),
            insets: .zero,
            alignment: .center,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(greenItem)
        greenView.configure(with: greenItem)

        ////////////////
        // yellowView //
        ////////////////
        let yellowItem = Item(
            id: "yellowItem",
            sizeGuide: SizeGuide(width: .fixed(15), height: .fixed(20)),
            insets: .zero,
            alignment: .trailingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(yellowItem)
        yellowView.configure(with: yellowItem)

        ////////////////
        // purpleView //
        ////////////////
        let purpleItem = Item(
            id: "purpleItem",
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            insets: .zero,
            alignment: .trailingCenter,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(purpleItem)
        purpleView.configure(with: purpleItem)

        ////////////////
        // orangeView //
        ////////////////
        let orangeItem = Item(
            id: "orangeItem",
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            insets: .zero,
            alignment: .leadingCenter,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(orangeItem)
        orangeView.configure(with: orangeItem)

        ////////////////////
        // lightGreenView //
        ////////////////////
        let lightGreenItem = Item(
            id: "lightGreenItem",
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            insets: .zero,
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(lightGreenItem)
        lightGreenView.configure(with: lightGreenItem)

        //////////////
        // pinkView //
        //////////////
        let pinkItem = Item(
            id: "pinkItem",
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            insets: .zero,
            alignment: .centerBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(pinkItem)
        pinkView.configure(with: pinkItem)

        let containerParentWidth: CGFloat = 360
        let containerParentHeight: CGFloat = 400

        /////////////////////////
        // containerParentItem //
        /////////////////////////
        var containerParentItem = Item(
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
