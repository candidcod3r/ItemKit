//
//  Item+Debug.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension Item {

    public func descriptionString() -> String {
        let classString = String(describing: type(of: self))
        let originString = NSCoder.string(for: origin)
        let sizeString = NSCoder.string(for: measurement)
        let itemIDString = id ?? "NO_ID"

        let descriptionString = "[<\(classString): \(itemIDString)>" + "origin: \(originString), size: \(sizeString)]"
        return descriptionString
    }

    public func debugDescription() -> String {
        return debugDescription(0)
    }

    func debugDescription(_ indentLevel: Int) -> String {
        return addToDebugString("", indentLevel: indentLevel)
    }

    /**
     Print using Depth first traversal
     */
    func addToDebugString(_ debugString: String, indentLevel: Int) -> String {
        let spacesString = "".padding(toLength: 2 * indentLevel, withPad: "-", startingAt: 0)

        var debugString = debugString + "|\(spacesString)\(descriptionString())\n"

        var subItemsString = ""
        for subItem in subItems {
            let subItemString = subItem.debugDescription(indentLevel + 1)
            subItemsString += subItemString
        }

        debugString += subItemsString
        return debugString
    }

}
