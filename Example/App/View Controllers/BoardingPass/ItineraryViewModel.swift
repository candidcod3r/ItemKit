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

    private(set) var fromTextItem: TextItem
    private(set) var fromAirportItem: TextItem
    private(set) var fromTimeItem: TextItem

    private(set) var flightImage = UIImage(named: "flight")?.withRenderingMode(.alwaysTemplate)
    private(set) var flightImageItem: Item

    private(set) var toTextItem: TextItem
    private(set) var toAirportItem: TextItem
    private(set) var toTimeItem: TextItem

    private(set) var item: ItemProtocol? = nil
    private var itemCache: ViewItemCache? = nil

    init() {
        fromTextItem = TextItem(
            id: "fromText",
            text: "FROM",
            font: Constant.fromTextFont,
            alignment: .center)

        fromAirportItem = TextItem(
            id: "fromAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        fromTimeItem = TextItem(
            id: "fromTime",
            text: "6:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        flightImageItem = Item(
            id: "flightImage",
            sizeGuide: SizeGuide(width: .fixed(32), height: .fixed(32)),
            alignment: .center,
            flexibility: .high)

        toTextItem = TextItem(
            id: "toText",
            text: "TO",
            font: Constant.fromTextFont,
            alignment: .center)

        toAirportItem = TextItem(
            id: "toAirport",
            text: "HYD",
            font: Constant.airportTextFont,
            alignment: .center)

        toTimeItem = TextItem(
            id: "toTime",
            text: "8:00AM",
            font: Constant.timeTextFont,
            alignment: .center)

        item = createItem()
        itemCache = item?.createCache()
    }

    private func createItem() -> ItemProtocol {
        let leftStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .leadingCenter,
            subItems: [fromTextItem, fromAirportItem, fromTimeItem])

        let rightStackItem = StackItem(
            axis: .vertical,
            spacing: 4,
            alignment: .trailingCenter,
            subItems: [toTextItem, toAirportItem, toTimeItem])

        return StackItem(
            id: "itineraryView",
            axis: .horizontal,
            distribution: .fillExtraSpace,
            insets: UIEdgeInsets(16),
            sizeGuide: SizeGuide(width: .fill, height: .fill),
            alignment: .center,
            subItems: [leftStackItem, flightImageItem, rightStackItem])
    }
}
