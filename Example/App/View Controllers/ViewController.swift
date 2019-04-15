//
//  ViewController.swift
//  ItemKit
//
//  Created by candidcod3r on 04/12/2019.
//  Copyright (c) 2019 candidcod3r.
//

import UIKit
import ItemKit

class ViewController: UIViewController {

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(hex: 0xFBFBFB)

        view.addSubview(contentView)
        contentView.addSubview(redView)
        contentView.addSubview(blueView)

        setup()
    }

    func setup() {
        let leftPadding: CGFloat = 4
        let topPadding: CGFloat = 64
        let contentWidth = self.view.bounds.width - 2 * leftPadding
        let contentHeight = 500 - 2 * topPadding

        contentView.frame = CGRect(
            x: leftPadding,
            y: topPadding,
            width: contentWidth,
            height: contentHeight)

        var redItem = Item(
            id: "redView",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        redItem.updateMeasurements(within: contentView.frame.size)
        redItem.updateLayouts(within: contentView.frame)

        redView.configure(redItem)
        redView.updateLayouts(with: redItem)
        print(redItem.debugDescription())

        var blueItem = Item(
            id: "blueView",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(20)),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        blueItem.updateMeasurements(within: contentView.frame.size)
        blueItem.updateLayouts(within: contentView.frame)

        blueView.configure(blueItem)
        blueView.updateLayouts(with: blueItem)
        print(blueItem.debugDescription())
        
    }

}

