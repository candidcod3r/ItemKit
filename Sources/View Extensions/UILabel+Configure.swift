//
//  UILabel+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UILabel {
    public func configure(withTextItem item: TextItem) {
        configure(withItem: item)
        switch item.text {
        case .simple(let text):
            self.text = text
        case .attributed(let attributedText):
            self.attributedText = attributedText
        }

        font = item.font
        numberOfLines = item.numberOfLines
    }
}
