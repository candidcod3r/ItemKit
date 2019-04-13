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

    override func viewDidLoad() {
        super.viewDidLoad()

        let item = Item(
            viewID: "",
            insets: .zero,
            sizeGuide: SizeGuide(
                width: .fillParent, widthRange: DimensionRange(),
                height: .fillParent, heightRange: DimensionRange()),
            alignment: Alignment(horizontal: .leading, vertical: .top),
            adaptability: .normal, subItems: [])

        item.updateMeasurement(within: .zero)
        item.updateLayout(within: .zero)
    }

}

