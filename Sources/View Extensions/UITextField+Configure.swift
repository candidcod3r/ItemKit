//
//  UITextField+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/12/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UITextField {
    open func configure(with item: TextItem?) {
        guard let item = item else {
            return
        }

        super.configure(with: item)

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
