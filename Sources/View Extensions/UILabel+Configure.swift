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

        super.configure(with: item)

        numberOfLines = item.numberOfLines

        guard let itemText = item.text else {
            text = nil
            font = item.font
            return
        }

        switch itemText {
        case .normal(let text):
            self.text = text
            font = item.font
        case .attributed(let attributedText):
            self.attributedText = attributedText
        }
    }
}
