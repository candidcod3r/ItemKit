//
//  UITextView+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UITextView {
    public func configure(withTextItem item: TextItem?) {
        guard let item = item else {
            return
        }
        
        configure(withItem: item)
        switch item.text {
        case .simple(let text):
            self.text = text
        case .attributed(let attributedText):
            self.attributedText = attributedText
        }

        font = item.font
        textContainerInset = item.textContainerInsets
        textContainer.lineFragmentPadding = item.lineFragmentPadding
        layoutManager.usesFontLeading = false
    }
}
