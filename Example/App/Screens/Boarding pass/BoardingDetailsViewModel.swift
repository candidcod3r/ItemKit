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

    private(set) var flightLabelItem: LabelItem
    private(set) var flightNumberItem: LabelItem

    private(set) var terminalLabelItem: LabelItem
    private(set) var terminalNumberItem: LabelItem

    private(set) var gateLabelItem: LabelItem
    private(set) var gateNumberItem: LabelItem

    private(set) var boardingLabelItem: LabelItem
    private(set) var boardingTimeItem: LabelItem

    private(set) var item: ViewItem? = nil

    init() {
        flightLabelItem = LabelItem(
            id: "flightText",
            text: "FLIGHT",
            font: Constant.headerFont)

        flightNumberItem = LabelItem(
            id: "flightNumber",
            text: "IK123",
            font: Constant.valueFont)

        terminalLabelItem = LabelItem(
            id: "terminalText",
            text: "TERMINAL",
            font: Constant.headerFont)

        terminalNumberItem = LabelItem(
            id: "terminalNumber",
            text: "3",
            font: Constant.valueFont)

        gateLabelItem = LabelItem(
            id: "gateText",
            text: "GATE",
            font: Constant.headerFont)

        gateNumberItem = LabelItem(
            id: "gateNumber",
            text: "12",
            font: Constant.valueFont)

        boardingLabelItem = LabelItem(
            id: "boardingText",
            text: "BOARDING",
            font: Constant.headerFont)

        boardingTimeItem = LabelItem(
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
