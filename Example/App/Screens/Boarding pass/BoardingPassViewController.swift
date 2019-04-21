//
//  BoardingPassViewController.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit
import ItemKit

class BoardingPassViewController: UIViewController {
    private let containerView: UIView = {
        let view = UIView()
        view.clipsToBounds = false
        view.layer.masksToBounds = false
        return view
    }()

    private let itineraryView = ItineraryView()
    private let boardingDetailsView = BoardingDetailsView()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing boarding pass layout"
        view.backgroundColor = UIColor(hex: 0xF5F6FA)
        view.clipsToBounds = false

        view.addSubview(containerView)
        containerView.addSubview(itineraryView)
        containerView.addSubview(boardingDetailsView)

        setup()
    }

    private func setup() {
        let viewBounds = self.view.bounds
        DispatchQueue.global(qos: .background).async {
            let itineraryViewModel = ItineraryViewModel()
            let boardingDetailsViewModel = BoardingDetailsViewModel()

            guard let itineraryItem = itineraryViewModel.item,
                let boardingItem = boardingDetailsViewModel.item else {
                return
            }

            let stackItem = StackItem(
                axis: .vertical,
                spacing: 24,
                sizeGuide: SizeGuide(width: .fill),
                alignment: .leadingTop,
                subItems: [itineraryItem, boardingItem])

            let containerItem = Item(
                id: "containerItem",
                sizeGuide: SizeGuide(width: .fill, height: .fill),
                subItems: [stackItem])

            let containerParentItem = Item(
                sizeGuide: SizeGuide(width: .fixed(360), height: .fixed(680)),
                insets: UIEdgeInsets(8),
                alignment: .centerTop,
                flexibility: .normal,
                subItems: [containerItem])

            containerParentItem.updateLayout(within: viewBounds)
            print(containerParentItem.debugDescription())

            DispatchQueue.main.async {
                self.itineraryView.configure(viewModel: itineraryViewModel)
                self.boardingDetailsView.configure(viewModel: boardingDetailsViewModel)

                self.containerView.configure(withItem: containerItem)
                self.containerView.updateLayout(with: containerParentItem)
            }
        }
    }
}

