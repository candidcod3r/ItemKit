//
//  SocialBarView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

class SocialBarView: UIView {
    private let likeButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.tintColor = .black
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    private let commentButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(hex: 0x545A63)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    private let shareButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(hex: 0x545A63)
        button.setTitleColor(.black, for: .normal)
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    private var viewModel: SocialBarViewModel? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(shareButton)
    }

    func configure(viewModel: SocialBarViewModel?) {
        likeButton.configure(withButtonItem: viewModel?.likeButtonItem)
        commentButton.configure(withButtonItem: viewModel?.commentButtonItem)
        shareButton.configure(withButtonItem: viewModel?.shareButtonItem)

        configure(withItem: viewModel?.item)
        self.viewModel = viewModel
    }
}
