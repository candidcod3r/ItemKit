//
//  UIColor+Debug.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIColor {

    convenience init(hex: Int) {
        let red = (CGFloat((hex >> 16) & 0xff)) / 255.0
        let green = (CGFloat((hex >> 8) & 0xff)) / 255.0
        let blue = (CGFloat((hex >> 0) & 0xff)) / 255.0
        let alpha = hex > 0xffffff ? (CGFloat((hex >> 24) & 0xff)) / 255.0 : 1

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }

    static var random: UIColor {
        let red = randomColorSpaceValue
        let blue = randomColorSpaceValue
        let green = randomColorSpaceValue

        let color = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        return color
    }

    private static var randomColorSpaceValue: CGFloat {
        return CGFloat(arc4random_uniform(256)) / 255.0
    }

}
