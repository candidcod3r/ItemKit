//
//  ImagesRollupView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/21/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class ImagesRollupView: UIView {
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar1")
        return imageView
    }()

    let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar2")
        return imageView
    }()

    let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar3")
        return imageView
    }()

    public var imageRadius: CGFloat

    private var imageViews: [UIImageView] {
        return [imageView1, imageView2, imageView3]
    }

    init(imageRadius: CGFloat) {
        self.imageRadius = imageRadius

        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        imageViews.forEach(addSubview)
        imageViews.forEach { configure(imageView: $0) }
    }

    func configure(withImagesRollupItem imagesRollupItem: ImagesRollupItem?) {
        guard let imagesRollupItem = imagesRollupItem else {
            return
        }

        configure(with: imagesRollupItem)
        for (subview, subItem) in zip(subviews, imagesRollupItem.subItems) {

            subview.configure(with: subItem as? Item)
        }
    }

    private func configure(imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = imageRadius
        imageView.layer.masksToBounds = true
    }
}
