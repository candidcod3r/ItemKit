//
//  UIButton+Configure.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension UIButton {
    open func configure<View: UIButton>(with item: ButtonItem<View>?) {
        guard let item = item else {
            return
        }

        super.configure(with: item)

        setTitle(item)
        setImage(item.image, for: .normal)

        titleEdgeInsets = item.titleInsets
        imageEdgeInsets = item.imageInsets
        contentEdgeInsets = item.contentInsets
    }

    open func setTitle<View: UIButton>(_ item: ButtonItem<View>) {
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
