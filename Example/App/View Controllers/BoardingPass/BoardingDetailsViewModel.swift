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
        static let headerFont = UIFont.helvetica(of: 17)
        static let valueFont = UIFont.helvetica(of: 21)
    }

    private(set) var flightTextItem: TextItem
    private(set) var flightNumberItem: TextItem

    private(set) var terminalTextItem: TextItem
    private(set) var terminalNumberItem: TextItem

    private(set) var gateTextItem: TextItem
    private(set) var gateNumberItem: TextItem

    private(set) var boardingTextItem: TextItem
    private(set) var boardingTimeItem: TextItem

    private(set) var item: ItemProtocol? = nil
    private(set) var itemCache: ViewItemCache? = nil

    init() {
        flightTextItem = TextItem(
            id: "flightText",
            text: "FLIGHT",
            font: Constant.headerFont)

        flightNumberItem = TextItem(
            id: "flightNumber",
            text: "IK123",
            font: Constant.valueFont)

        terminalTextItem = TextItem(
            id: "terminalText",
            text: "TERMINAL",
            font: Constant.headerFont)

        terminalNumberItem = TextItem(
            id: "terminalNumber",
            text: "3",
            font: Constant.valueFont)

        gateTextItem = TextItem(
            id: "gateText",
            text: "GATE",
            font: Constant.headerFont)

        gateNumberItem = TextItem(
            id: "gateNumber",
            text: "12",
            font: Constant.valueFont)

        boardingTextItem = TextItem(
            id: "gateText",
            text: "GATE",
            font: Constant.headerFont)

        boardingTimeItem = TextItem(
            id: "boardingTime",
            text: "12:30AM",
            font: Constant.valueFont)

        item = createItem()
        itemCache = item?.createCache()
    }

    private func createItem() -> ItemProtocol {
        let flightStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [flightTextItem, flightNumberItem])

        let terminalStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [terminalTextItem, terminalTextItem])

        let gateStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [gateTextItem, gateNumberItem])

        let boardingStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [boardingTextItem, boardingTimeItem])

        let topStackItem = StackItem(
            axis: .horizontal,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            subItems: [flightStackItem, terminalStackItem])

        let bottomStackItem = StackItem(
            axis: .horizontal,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            subItems: [gateStackItem, boardingStackItem])

        return StackItem(
            axis: .vertical,
            spacing: 16,
            insets: UIEdgeInsets(8),
            sizeGuide: SizeGuide(width: .fill),
            subItems: [topStackItem, bottomStackItem])
    }


}
