//
//  ViewController.swift
//  ItemKit
//
//  Created by candidcod3r on 04/12/2019.
//  Copyright (c) 2019 candidcod3r.
//

import UIKit
import ItemKit

class TestFixedViewController: UIViewController {

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

    let greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    let yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xFFCC00)
        return view
    }()

    let purpleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xC86EDF)
        return view
    }()

    let orangeView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()

    let lightGreenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0x55EFCB)
        return view
    }()

    let pinkView: UIView = {
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

    func setup() {
        ///////////////////
        // containerView //
        ///////////////////
        var containerItem = Item(
            id: "containerItem",
            sizeGuide: SizeGuide(width: .fill, height: .fill))
        containerView.configure(withItem: containerItem)

        /////////////
        // redView //
        /////////////
        let redItem = Item(
            id: "redItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(20)),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(redItem)
        redView.configure(withItem: redItem)

        //////////////
        // blueView //
        //////////////
        let blueItem = Item(
            id: "blueItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(10)),
            alignment: .trailingTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(blueItem)
        blueView.configure(withItem: blueItem)

        //////////////
        // cyanView //
        //////////////
        let cyanItem = Item(
            id: "cyanItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(20)),
            alignment: .leadingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(cyanItem)
        cyanView.configure(withItem: cyanItem)

        ///////////////
        // greenView //
        ///////////////
        let greenItem = Item(
            id: "greenItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(50), height: .fixed(50)),
            alignment: .center,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(greenItem)
        greenView.configure(withItem: greenItem)

        ////////////////
        // yellowView //
        ////////////////
        let yellowItem = Item(
            id: "yellowItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(15), height: .fixed(20)),
            alignment: .trailingBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(yellowItem)
        yellowView.configure(withItem: yellowItem)

        ////////////////
        // purpleView //
        ////////////////
        let purpleItem = Item(
            id: "purpleItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .trailingCenter,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(purpleItem)
        purpleView.configure(withItem: purpleItem)

        ////////////////
        // orangeView //
        ////////////////
        let orangeItem = Item(
            id: "orangeItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .leadingCenter,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(orangeItem)
        orangeView.configure(withItem: orangeItem)

        ////////////////////
        // lightGreenView //
        ////////////////////
        let lightGreenItem = Item(
            id: "lightGreenItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(lightGreenItem)
        lightGreenView.configure(withItem: lightGreenItem)

        //////////////
        // pinkView //
        //////////////
        let pinkItem = Item(
            id: "pinkItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .centerBottom,
            flexibility: .normal,
            subItems: [])
        containerItem.subItems.append(pinkItem)
        pinkView.configure(withItem: pinkItem)

        let containerParentWidth: CGFloat = 360
        let containerParentHeight: CGFloat = 400

        /////////////////////////
        // containerParentItem //
        /////////////////////////
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
