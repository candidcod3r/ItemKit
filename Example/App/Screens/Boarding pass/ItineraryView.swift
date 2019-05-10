//
//  ItineraryView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

class ItineraryView: UIView {
    private(set) var viewModel: ItineraryViewModel?

    private let fromTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let fromAirportLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let fromTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let toTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let toAirportLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let toTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()

    private let flightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .gray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 4

        addSubview(fromTextLabel)
        addSubview(fromAirportLabel)
        addSubview(fromTimeLabel)

        addSubview(toTextLabel)
        addSubview(toAirportLabel)
        addSubview(toTimeLabel)

        addSubview(flightImageView)
    }

    func configure(viewModel: ItineraryViewModel?) {
        fromTextLabel.configure(withTextItem: viewModel?.fromTextItem)
        fromAirportLabel.configure(withTextItem: viewModel?.fromAirportItem)
        fromTimeLabel.configure(withTextItem: viewModel?.fromTimeItem)

        toTextLabel.configure(withTextItem: viewModel?.toTextItem)
        toAirportLabel.configure(withTextItem: viewModel?.toAirportItem)
        toTimeLabel.configure(withTextItem: viewModel?.toTimeItem)

        flightImageView.configure(with: viewModel?.flightImageItem)
        flightImageView.image = viewModel?.flightImage

        configure(with: viewModel?.item)
        self.viewModel = viewModel
    }
}
