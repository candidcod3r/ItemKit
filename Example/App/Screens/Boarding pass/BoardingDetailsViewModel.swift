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

    private(set) var flightLabelItem: TextItem
    private(set) var flightNumberItem: TextItem

    private(set) var terminalLabelItem: TextItem
    private(set) var terminalNumberItem: TextItem

    private(set) var gateLabelItem: TextItem
    private(set) var gateNumberItem: TextItem

    private(set) var boardingLabelItem: TextItem
    private(set) var boardingTimeItem: TextItem

    private(set) var item: Itemable? = nil

    init() {
        flightLabelItem = TextItem(
            id: "flightText",
            text: "FLIGHT",
            font: Constant.headerFont)

        flightNumberItem = TextItem(
            id: "flightNumber",
            text: "IK123",
            font: Constant.valueFont)

        terminalLabelItem = TextItem(
            id: "terminalText",
            text: "TERMINAL",
            font: Constant.headerFont)

        terminalNumberItem = TextItem(
            id: "terminalNumber",
            text: "3",
            font: Constant.valueFont)

        gateLabelItem = TextItem(
            id: "gateText",
            text: "GATE",
            font: Constant.headerFont)

        gateNumberItem = TextItem(
            id: "gateNumber",
            text: "12",
            font: Constant.valueFont)

        boardingLabelItem = TextItem(
            id: "boardingText",
            text: "BOARDING",
            font: Constant.headerFont)

        boardingTimeItem = TextItem(
            id: "boardingTime",
            text: "12:30AM",
            font: Constant.valueFont)

        item = createItem()
    }

    private func createItem() -> Item {
        let flightStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [flightLabelItem, flightNumberItem])

        let terminalStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [terminalLabelItem, terminalNumberItem])

        let gateStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [gateLabelItem, gateNumberItem])

        let boardingStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [boardingLabelItem, boardingTimeItem])

        let topStackItem = StackItem(
            axis: .horizontal,
            distribution: .equalSize,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [flightStackItem, terminalStackItem])

        let bottomStackItem = StackItem(
            axis: .horizontal,
            distribution: .equalSize,
            sizeGuide: SizeGuide(width: .fill),
            subItems: [gateStackItem, boardingStackItem])

        return StackItem(
            id: "boardingDetailsView",
            axis: .vertical,
            spacing: 16,
            sizeGuide: SizeGuide(width: .fill),
            insets: UIEdgeInsets(16),
            subItems: [topStackItem, bottomStackItem])
    }
}
