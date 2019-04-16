//
//  ItemProtocol+Debug.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension ItemProtocol {
    func descriptionString() -> String {
        let classString = String(describing: type(of: self))
        let originString = "(\(origin.x), \(origin.y))"
        let sizeString = "(\(measurement.width), \(measurement.height))"
        let itemIDString = id ?? "NO_ID"

        let descriptionString = "[<\(classString):\(itemIDString)>" + " origin:\(originString) size:\(sizeString)]"
        return descriptionString
    }

    /**
     Print using Depth first traversal
     */
    public func debugDescription(_ debugString: String = "", indentLevel: Int = 0) -> String {
        let spacesString = "".padding(toLength: 2 * indentLevel, withPad: "-", startingAt: 0)

        var debugString = debugString + "|\(spacesString)\(descriptionString())\n"

        var subItemsString = ""
        for subItem in subItems {
            let subItemString = subItem.debugDescription("", indentLevel: indentLevel + 1)
            subItemsString += subItemString
        }

        debugString += subItemsString
        return debugString
    }
}
