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

    let contentView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        return view
    }()

    let grayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: 0xF0F0F0)
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

        view.addSubview(contentView)
        contentView.addSubview(grayView)
        grayView.addSubview(redView)
        grayView.addSubview(blueView)
        grayView.addSubview(cyanView)
        grayView.addSubview(yellowView)
        grayView.addSubview(orangeView)
        grayView.addSubview(greenView)

        setup()
    }

    func setup() {
        let leftPadding: CGFloat = 8
        let topPadding: CGFloat = 8
        let contentWidth: CGFloat = self.view.bounds.width - 2 * leftPadding
        let contentHeight: CGFloat = 400

        contentView.frame = CGRect(
            x: leftPadding,
            y: topPadding,
            width: contentWidth,
            height: contentHeight)

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
        orangeView.configure(orangeItem)

        //////////////
        // grayView //
        //////////////
        var grayItem = Item(
            id: "grayItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [redItem, blueItem, cyanItem, greenItem, yellowItem, orangeItem])
        grayItem.updateMeasurements(within: contentView.bounds.size)
        grayItem.updateLayouts(within: contentView.bounds)
        print(grayItem.debugDescription())

        grayView.configure(grayItem)
        grayView.updateLayouts(with: grayItem)
    }

}
