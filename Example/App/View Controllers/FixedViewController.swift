//
//  ViewController.swift
//  ItemKit
//
//  Created by candidcod3r on 04/12/2019.
//  Copyright (c) 2019 candidcod3r.
//

import UIKit
import ItemKit

class FixedViewController: UIViewController {

    let contentView: UIView = {
        let view = UIView()
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
        view.backgroundColor = UIColor(hex: 0xFF2D55)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing fixed size guide"
        view.backgroundColor = .white

        view.addSubview(contentView)
        contentView.addSubview(grayView)
        contentView.addSubview(redView)
        contentView.addSubview(blueView)
        contentView.addSubview(cyanView)
        contentView.addSubview(greenView)
        contentView.addSubview(yellowView)
        contentView.addSubview(purpleView)
        contentView.addSubview(orangeView)
        contentView.addSubview(lightGreenView)
        contentView.addSubview(pinkView)

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

        var grayItem = Item(
            id: "grayItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        grayItem.updateMeasurements(within: contentView.bounds.size)
        grayItem.updateLayouts(within: contentView.bounds)
        print(grayItem.debugDescription())

        grayView.configure(grayItem)
        grayView.updateLayouts(with: grayItem)

        var redItem = Item(
            id: "redItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(40), height: .fixed(20)),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        redItem.updateMeasurements(within: contentView.bounds.size)
        redItem.updateLayouts(within: contentView.bounds)
        print(redItem.debugDescription())

        redView.configure(redItem)
        redView.updateLayouts(with: redItem)

        var blueItem = Item(
            id: "blueItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(10)),
            alignment: .trailingTop,
            flexibility: .normal,
            subItems: [])
        blueItem.updateMeasurements(within: contentView.bounds.size)
        blueItem.updateLayouts(within: contentView.bounds)
        print(blueItem.debugDescription())

        blueView.configure(blueItem)
        blueView.updateLayouts(with: blueItem)

        var cyanItem = Item(
            id: "cyanItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(20)),
            alignment: .leadingBottom,
            flexibility: .normal,
            subItems: [])
        cyanItem.updateMeasurements(within: contentView.bounds.size)
        cyanItem.updateLayouts(within: contentView.bounds)
        print(cyanItem.debugDescription())

        cyanView.configure(cyanItem)
        cyanView.updateLayouts(with: cyanItem)

        var greenItem = Item(
            id: "greenItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(50), height: .fixed(50)),
            alignment: .center,
            flexibility: .normal,
            subItems: [])
        greenItem.updateMeasurements(within: contentView.bounds.size)
        greenItem.updateLayouts(within: contentView.bounds)
        print(greenItem.debugDescription())

        greenView.configure(greenItem)
        greenView.updateLayouts(with: greenItem)

        var yellowItem = Item(
            id: "yellowItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(15), height: .fixed(20)),
            alignment: .trailingBottom,
            flexibility: .normal,
            subItems: [])
        yellowItem.updateMeasurements(within: contentView.bounds.size)
        yellowItem.updateLayouts(within: contentView.bounds)
        print(yellowItem.debugDescription())

        yellowView.configure(yellowItem)
        yellowView.updateLayouts(with: yellowItem)

        var purpleItem = Item(
            id: "purpleItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .trailingCenter,
            flexibility: .normal,
            subItems: [])
        purpleItem.updateMeasurements(within: contentView.bounds.size)
        purpleItem.updateLayouts(within: contentView.bounds)
        print(purpleItem.debugDescription())

        purpleView.configure(purpleItem)
        purpleView.updateLayouts(with: purpleItem)

        var orangeItem = Item(
            id: "orangeItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .leadingCenter,
            flexibility: .normal,
            subItems: [])
        orangeItem.updateMeasurements(within: contentView.bounds.size)
        orangeItem.updateLayouts(within: contentView.bounds)
        print(orangeItem.debugDescription())

        orangeView.configure(orangeItem)
        orangeView.updateLayouts(with: orangeItem)

        var lightGreenItem = Item(
            id: "lightGreenItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .centerTop,
            flexibility: .normal,
            subItems: [])
        lightGreenItem.updateMeasurements(within: contentView.bounds.size)
        lightGreenItem.updateLayouts(within: contentView.bounds)
        print(lightGreenItem.debugDescription())

        lightGreenView.configure(lightGreenItem)
        lightGreenView.updateLayouts(with: lightGreenItem)

        var pinkItem = Item(
            id: "pinkItem",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(20), height: .fixed(20)),
            alignment: .centerBottom,
            flexibility: .normal,
            subItems: [])
        pinkItem.updateMeasurements(within: contentView.bounds.size)
        pinkItem.updateLayouts(within: contentView.bounds)
        print(pinkItem.debugDescription())

        pinkView.configure(pinkItem)
        pinkView.updateLayouts(with: pinkItem)
    }

}

