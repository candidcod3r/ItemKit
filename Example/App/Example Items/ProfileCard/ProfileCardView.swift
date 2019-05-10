//
//  ProfileCardView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/22/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class ProfileCardView: UIView {
    struct Constant {
        static let actionButtonTintColor = UIColor(hex: 0x1CA1F1)
    }
    private let actorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let actionButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.imageView?.contentMode = .scaleAspectFill
        button.setTitleColor(Constant.actionButtonTintColor, for: .normal)
        button.tintColor = Constant.actionButtonTintColor
        button.layer.borderWidth = 1
        button.layer.borderColor = Constant.actionButtonTintColor.cgColor
        button.layer.cornerRadius = 4
        return button
    }()

    private var viewModel: ActorViewModel? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(actorImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }

    func configure(viewModel: ActorViewModel?) {
        actorImageView.configure(with: viewModel?.imageItem)
        titleLabel.configure(with: viewModel?.titleItem)
        subtitleLabel.configure(with: viewModel?.subtitleItem)
        actionButton.configure(with: viewModel?.actionButtonItem)

        actorImageView.image = viewModel?.image

        configure(with: viewModel?.item)
        self.viewModel = viewModel
    }
}
