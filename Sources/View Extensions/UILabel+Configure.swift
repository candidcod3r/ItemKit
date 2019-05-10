//
//  UILabel+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UILabel {
    open func configure(with item: TextItem?) {
        guard let item = item else {
            return
        }

        (self as UIView).configure(with: item)

        switch item.text {
        case .normal(let text):
            self.text = text
            font = item.font
        case .attributed(let attributedText):
            self.attributedText = attributedText
        }

        numberOfLines = item.numberOfLines
    }
}
