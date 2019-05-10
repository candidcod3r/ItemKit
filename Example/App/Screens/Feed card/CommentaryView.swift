//
//  CommentaryView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

class CommentaryView: UIView {
    private let textView: UITextView = {
        let textView = UITextView()
        textView.textColor = .black
        textView.scrollsToTop = false
        textView.isScrollEnabled = false
        textView.showsVerticalScrollIndicator = false
        textView.showsHorizontalScrollIndicator = false
        return textView
    }()

    private var viewModel: CommentaryViewModel? = nil

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        addSubview(textView)
    }

    func configure(viewModel: CommentaryViewModel?) {
        textView.configure(withTextItem: viewModel?.textItem)

        configure(with: viewModel?.item)
        self.viewModel = viewModel
    }
}
