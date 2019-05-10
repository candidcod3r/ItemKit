//
//  UIButton+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIButton {
    open func configure(with item: ButtonItem?) {
        guard let item = item else {
            return
        }

        (self as UIView).configure(with: item)

        setTitle(item)
        setImage(item.image, for: .normal)

        titleEdgeInsets = item.titleInsets
        imageEdgeInsets = item.imageInsets
        contentEdgeInsets = item.contentInsets
    }

    func setTitle(_ item: ButtonItem) {
        guard let title = item.title else {
            setTitle(nil, for: .normal)
            return
        }

        switch title {
        case .normal(let title):
            setTitle(title, for: [.normal])
            titleLabel?.font = item.font
        case .attributed(let attributedTitle):
            setAttributedTitle(attributedTitle, for: .normal)
        }
    }
}
