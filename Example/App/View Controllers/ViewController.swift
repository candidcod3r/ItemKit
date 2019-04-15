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

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(contentView)
        contentView.addSubview(redView)

        setup()
    }

    func setup() {
        let leftPadding: CGFloat = 16
        let topPadding: CGFloat = 64
        let contentWidth = self.view.bounds.width - 2 * leftPadding
        let contentHeight = self.view.frame.height - 2 * topPadding

        contentView.frame = CGRect(
            x: leftPadding,
            y: topPadding,
            width: contentWidth,
            height: contentHeight)

        var redItem = Item(
            id: "redView",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fillParent, height: .fillParent),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])
        redView.configure(redItem)

        redItem.updateMeasurements(within: contentView.frame.size)
        redItem.updateLayouts(within: contentView.frame)

        redView.updateLayout(with: redItem)
    }

}

