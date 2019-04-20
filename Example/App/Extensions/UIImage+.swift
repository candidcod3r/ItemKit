//
//  UIImage+.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

extension UIImage {

    func resized(toWidth: CGFloat) -> UIImage {
        guard size.width != 0 else {
            return self
        }

        let scale = toWidth / size.width
        let toHeight = size.height * scale

        let toSize = CGSize(width: toWidth, height: toHeight)

        UIGraphicsBeginImageContextWithOptions(toSize, false, 1)
        draw(in: CGRect(origin: .zero, size: toSize))
        let toImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return toImage ?? self
    }

}
