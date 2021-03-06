//
//  Text.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

public enum Text {
    case normal(String)
    case attributed(NSAttributedString)

    public init?(_ string: String?) {
        guard let string = string else {
            return nil
        }
        self = .normal(string)
    }

    public init?(_ attributedString: NSAttributedString?) {
        guard let attributedString = attributedString else {
            return nil
        }
        self = .attributed(attributedString)
    }

    public var isEmpty: Bool {
        switch self {
        case .normal(let string):
            return string.isEmpty
        case .attributed(let attributedString):
            return attributedString.string.isEmpty
        }
    }

    public func size(with font: UIFont, within maxSize: CGSize) -> CGSize {
        guard !isEmpty else {
            return .zero
        }

        let options: NSStringDrawingOptions = [.usesLineFragmentOrigin, .usesFontLeading]

        let textSize: CGSize
        switch self {
        case .normal(let string):
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

// MARK: - Helpful methods

extension Text {
    public var string: String {
        switch self {
        case .normal(let string):
            return string
        case .attributed(let attributedString):
            return attributedString.string
        }
    }
}
