//
//  Text.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

public enum Text {
    case simple(String)
    case attributed(NSAttributedString)

    var isEmpty: Bool {
        switch self {
        case .simple(let string):
            return string.isEmpty
        case .attributed(let attributedString):
            return attributedString.string.isEmpty
        }
    }

    func size(with font: UIFont, within maxSize: CGSize) -> CGSize {
        guard !isEmpty else {
            return .zero
        }

        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin]

        let textSize: CGSize
        switch self {
        case .simple(let string):
            let boundingRect = string.boundingRect(
                with: maxSize,
                options: options,
                attributes: [NSAttributedString.Key.font: font],
                context: nil)

            textSize = boundingRect.size
        case .attributed(let attributedString):
            let fontAppliedAttributedString = attributedString.apply(font: font)
            let boundingRect = fontAppliedAttributedString.boundingRect(
                with: maxSize,
                options: options,
                context: nil)

            textSize = boundingRect.size
        }
        
        return textSize.roundedUp
    }
}
