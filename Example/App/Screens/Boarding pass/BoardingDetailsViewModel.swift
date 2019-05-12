//
//  BoardingDetailsViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class BoardingDetailsViewModel {
    struct Constant {
        static let headerFont = UIFont.helveticaLight(of: 17)
        static let valueFont = UIFont.helvetica(of: 21)
    }

    private(set) var flightLabelItem: LabelViewItem
    private(set) var flightNumberItem: LabelViewItem

    private(set) var terminalLabelItem: LabelViewItem
    private(set) var terminalNumberItem: LabelViewItem

    private(set) var gateLabelItem: LabelViewItem
    private(set) var gateNumberItem: LabelViewItem

    private(set) var boardingLabelItem: LabelViewItem
    private(set) var boardingTimeItem: LabelViewItem

    private(set) var item: ViewItem? = nil

    init() {
        flightLabelItem = LabelViewItem(
            id: "flightText",
            text: "FLIGHT",
            font: Constant.headerFont)

        flightNumberItem = LabelViewItem(
            id: "flightNumber",
            text: "IK123",
            font: Constant.valueFont)

        terminalLabelItem = LabelViewItem(
            id: "terminalText",
            text: "TERMINAL",
            font: Constant.headerFont)

        terminalNumberItem = LabelViewItem(
            id: "terminalNumber",
            text: "3",
            font: Constant.valueFont)

        gateLabelItem = LabelViewItem(
            id: "gateText",
            text: "GATE",
            font: Constant.headerFont)

        gateNumberItem = LabelViewItem(
            id: "gateNumber",
            text: "12",
            font: Constant.valueFont)

        boardingLabelItem = LabelViewItem(
            id: "boardingText",
            text: "BOARDING",
            font: Constant.headerFont)

        boardingTimeItem = LabelViewItem(
            id: "boardingTime",
            text: "12:30AM",
            font: Constant.valueFont)

        item = createItem()
    }

    private func createItem() -> ViewItem {
        let flightStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [flightLabelItem, flightNumberItem])

        let terminalStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [terminalLabelItem, terminalNumberItem])

        let gateStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [gateLabelItem, gateNumberItem])

        let boardingStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [boardingLabelItem, boardingTimeItem])

        let topStackItem = StackViewItem(
            axis: .horizontal,
            distribution: .equalSize,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [flightStackItem, terminalStackItem])

        let bottomStackItem = StackViewItem(
            axis: .horizontal,
            distribution: .equalSize,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [gateStackItem, boardingStackItem])

        return StackViewItem(
            id: "boardingDetailsView",
            axis: .vertical,
            spacing: 16,
            sizeGuide: SizeGuide(width: .fill),
            insets: UIEdgeInsets(16),
            subItems: [topStackItem, bottomStackItem])
    }
}
