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

        var item = Item(
            viewID: "",
            insets: .zero,
            sizeGuide: SizeGuide(width: .fillParent, height: .fillParent),
            alignment: .leadingTop,
            flexibility: .normal,
            subItems: [])

        item.updateMeasurements(within: .zero)
        item.updateLayouts(within: .zero)
    }

}

