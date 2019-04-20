//
//  SocialCountsView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

class SocialCountsView: UIView {
    private let likesCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()

    private let dotLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()

    private let commentsCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        return label
    }()

    private var viewModel: SocialCountsViewModel? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(likesCountLabel)
        addSubview(dotLabel)
        addSubview(commentsCountLabel)
    }

    func configure(viewModel: SocialCountsViewModel?) {
        likesCountLabel.configure(withTextItem: viewModel?.likesCountItem)
        dotLabel.configure(withTextItem: viewModel?.dotItem)
        commentsCountLabel.configure(withTextItem: viewModel?.commentsCountItem)

        configure(withItem: viewModel?.item)
        self.viewModel = viewModel
    }
}
