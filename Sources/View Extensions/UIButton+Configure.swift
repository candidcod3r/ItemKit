//
//  UIButton+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIButton {
    public func configure(withButtonItem item: ButtonItem) {
        configure(withItem: item)

        setTitle(item.title)
        setImage(item.image, for: .normal)
        titleLabel?.font = item.font
        titleEdgeInsets = item.titleInsets
        imageEdgeInsets = item.imageInsets
        contentEdgeInsets = item.contentInsets
    }

    func setTitle(_ title: Text?) {
        guard let title = title else {
            setTitle(nil, for: .normal)
            return
        }

        switch title {
        case .simple(let title):
            setTitle(title, for: [.normal])
        case .attributed(let attributedTitle):
            setAttributedTitle(attributedTitle, for: .normal)
        }
    }
}
