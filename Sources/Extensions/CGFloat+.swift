//
//  CGFloat+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension CGFloat {

    var roundedUp: CGFloat {
        if self == 0 {
            return 0
        }

        if self < 0 {
            return -(-self).roundedDown
        }

        let pixelsPerPoint = UIScreen.main.scale
        let pointsPerPixel = 1.0 / pixelsPerPoint

        if self <= pointsPerPixel {
            return pointsPerPixel
        }

        return ceil(self * pixelsPerPoint) / pixelsPerPoint
    }

    var roundedDown: CGFloat {
        if self == 0 {
            return 0
        }

        if self < 0 {
            return -(-self).roundedUp
        }

        let pixelsPerPoint = UIScreen.main.scale
        let pointsPerPixel = 1.0 / pixelsPerPoint

        if self <= pointsPerPixel {
            return 0
        }

        return ceil(self * pixelsPerPoint) / pixelsPerPoint
    }

    var rounded: CGFloat {
        if self == 0 {
            return 0
        }

        let roundedUpValue = roundedUp
        let roundedDownValue = roundedDown
        return roundedUpValue - self <= self - roundedDownValue ? roundedUpValue : roundedDownValue
    }


}
