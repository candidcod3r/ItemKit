//
//  ActorView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class ActorView: UIView {
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
        button.setTitleColor(.black, for: .normal)
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
        backgroundColor = .white
        
        addSubview(actorImageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)
    }

    func configure(viewModel: ActorViewModel?) {
        actorImageView.configure(withItem: viewModel?.imageItem)
        titleLabel.configure(withTextItem: viewModel?.titleItem)
        subtitleLabel.configure(withTextItem: viewModel?.subtitleItem)
        actionButton.configure(withButtonItem: viewModel?.actionButtonItem)

        actorImageView.image = viewModel?.image

        configure(withItem: viewModel?.item)
        self.viewModel = viewModel
    }
}
