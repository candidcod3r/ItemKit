//
//  ItineraryViewModel.swift
//  ItemKitExample
//
//  Created by Candid Cod3r on 4/18/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import ItemKit

class ItineraryViewModel {
    struct Constant {
        static let fromTextFont = UIFont.helvetica(of: 14)
        static let airportTextFont = UIFont.helvetica(of: 28)
        static let timeTextFont = UIFont.helvetica(of: 14)
    }

    private(set) var fromLabelItem: LabelViewItem
    private(set) var fromAirportItem: LabelViewItem
    private(set) var fromTimeItem: LabelViewItem

    private(set) var flightImage = UIImage(named: "flight")?.withRenderingMode(.alwaysTemplate)
    private(set) var flightImageItem: ViewItem

    private(set) var toLabelItem: LabelViewItem
    private(set) var toAirportItem: LabelViewItem
    private(set) var toTimeItem: LabelViewItem

    private(set) var item: ViewItem? = nil

    init() {
        fromLabelItem = LabelViewItem(
            id: "fromText",
            text: "FROM",
            font: Constant.fromTextFont,
            alignment: .center)

        fromAirportItem = LabelViewItem(
            id: "fromAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        fromTimeItem = LabelViewItem(
            id: "fromTime",
            text: "6:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        flightImageItem = ViewItem(
            id: "flightImage",
            sizeGuide: SizeGuide(width: .fixed(32), height: .fixed(32)),
            alignment: .center,
            flexibility: .high)

        toLabelItem = LabelViewItem(
            id: "toText",
            text: "TO",
            font: Constant.fromTextFont,
            alignment: .center)

        toAirportItem = LabelViewItem(
            id: "toAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        toTimeItem = LabelViewItem(
            id: "toTime",
            text: "8:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        item = createItem()
    }

    private func createItem() -> ViewItem {
        let leftStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [fromLabelItem, fromAirportItem, fromTimeItem])

        let rightStackItem = StackViewItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [toLabelItem, toAirportItem, toTimeItem])

        return StackViewItem(
            id: "itineraryView",
            axis: .horizontal,
            distribution: .fillExtraSpace,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            insets: UIEdgeInsets(16),
            alignment: .center,
            subItems: [leftStackItem, flightImageItem, rightStackItem])
    }
}
