//
//  FeedCardViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/19/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class FeedCardViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 4
        return view
    }()

    private let actorView = ActorView()
    private let commentaryView = CommentaryView()
    private let socialCountsView = SocialCountsView()
    private let socialBarView = SocialBarView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing feed card layout"
        view.backgroundColor = UIColor(hex: 0xF5F6FA)
        view.clipsToBounds = false

        view.addSubview(containerView)
        containerView.addSubview(actorView)
        containerView.addSubview(commentaryView)
        containerView.addSubview(socialCountsView)
        containerView.addSubview(socialBarView)

        setup()
    }

    private func setup() {
        let viewBounds = self.view.bounds
        DispatchQueue.global(qos: .background).async {
            let actorViewModel = ActorViewModel()
            let commentaryViewModel = CommentaryViewModel()
            let socialCountsViewModel = SocialCountsViewModel()
            let socialBarViewModel = SocialBarViewModel()

            guard let actorViewItem = actorViewModel.item,
                let commentaryItem = commentaryViewModel.item,
                let socialCountsItem = socialCountsViewModel.item,
                let socialBarItem = socialBarViewModel.item else {
                    return
            }

            let stackItem = StackItem(
                axis: .vertical,
                sizeGuide: SizeGuide(width: .fill),
                subItems: [actorViewItem]) //, commentaryItem, socialCountsItem, socialBarItem])

            let containerItem = Item(
                id: "containerItem",
                sizeGuide: SizeGuide(width: .fill),
                subItems: [stackItem])

            var containerParentItem = Item(
                insets: UIEdgeInsets(8),
                sizeGuide: SizeGuide(width: .fixed(360), height: .fixed(680)),
                alignment: .centerTop,
                flexibility: .normal,
                subItems: [containerItem])

            containerParentItem.updateLayout(within: viewBounds)
            print(containerParentItem.debugDescription())

            DispatchQueue.main.async {
                self.actorView.configure(viewModel: actorViewModel)
                self.commentaryView.configure(viewModel: commentaryViewModel)
                self.socialCountsView.configure(viewModel: socialCountsViewModel)
                self.socialBarView.configure(viewModel: socialBarViewModel)

                self.containerView.configure(withItem: containerItem)
                self.containerView.updateLayout(with: containerParentItem)
            }
        }
    }
}

