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

    private(set) var fromLabelItem: LabelItem
    private(set) var fromAirportItem: LabelItem
    private(set) var fromTimeItem: LabelItem

    private(set) var flightImage = UIImage(named: "flight")?.withRenderingMode(.alwaysTemplate)
    private(set) var flightImageItem: ViewItem

    private(set) var toLabelItem: LabelItem
    private(set) var toAirportItem: LabelItem
    private(set) var toTimeItem: LabelItem

    private(set) var item: ViewItem? = nil

    init() {
        fromLabelItem = LabelItem(
            id: "fromText",
            text: "FROM",
            font: Constant.fromTextFont,
            alignment: .center)

        fromAirportItem = LabelItem(
            id: "fromAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        fromTimeItem = LabelItem(
            id: "fromTime",
            text: "6:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        flightImageItem = ViewItem(
            id: "flightImage",
            sizeGuide: SizeGuide(width: .fixed(32), height: .fixed(32)),
            alignment: .center,
            flexibility: .high)

        toLabelItem = LabelItem(
            id: "toText",
            text: "TO",
            font: Constant.fromTextFont,
            alignment: .center)

        toAirportItem = LabelItem(
            id: "toAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        toTimeItem = LabelItem(
            id: "toTime",
            text: "8:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        item = createItem()
    }

    private func createItem() -> ViewItem {
        let leftStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [fromLabelItem, fromAirportItem, fromTimeItem])

        let rightStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [toLabelItem, toAirportItem, toTimeItem])

        return StackItem(
            id: "itineraryView",
            axis: .horizontal,
            distribution: .fillExtraSpace,
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            insets: UIEdgeInsets(16),
            alignment: .center,
            subItems: [leftStackItem, flightImageItem, rightStackItem])
    }
}
