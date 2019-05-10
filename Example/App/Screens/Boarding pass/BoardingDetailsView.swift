//
//  BoardingDetailsView.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import UIKit

class BoardingDetailsView: UIView {
    private(set) var viewModel: BoardingDetailsViewModel?

    private let flightTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let flightNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let terminalTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let terminalNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let gateTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let gateNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()


    private let boardingTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    private let boardingTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        backgroundColor = UIColor(hex: 0xF21B3E)
        layer.cornerRadius = 4

        addSubview(flightTextLabel)
        addSubview(flightNumberLabel)

        addSubview(terminalTextLabel)
        addSubview(terminalNumberLabel)

        addSubview(gateTextLabel)
        addSubview(gateNumberLabel)

        addSubview(boardingTimeLabel)
        addSubview(boardingTextLabel)
    }

    func configure(viewModel: BoardingDetailsViewModel?) {
        flightTextLabel.configure(withTextItem: viewModel?.flightTextItem)
        flightNumberLabel.configure(withTextItem: viewModel?.flightNumberItem)

        terminalTextLabel.configure(withTextItem: viewModel?.terminalTextItem)
        terminalNumberLabel.configure(withTextItem: viewModel?.terminalNumberItem)

        gateTextLabel.configure(withTextItem: viewModel?.gateTextItem)
        gateNumberLabel.configure(withTextItem: viewModel?.gateNumberItem)

        boardingTextLabel.configure(withTextItem: viewModel?.boardingTextItem)
        boardingTimeLabel.configure(withTextItem: viewModel?.boardingTimeItem)

        configure(with: viewModel?.item)
        self.viewModel = viewModel
    }
}
