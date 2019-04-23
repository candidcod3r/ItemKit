//
//  Itemable+Debug.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension Itemable {
    func descriptionString() -> String {
        let classString = String(describing: type(of: self))
        let frameString = frame.formatted
        let itemIDString = id ?? "NO_ID"

        let descriptionString = "[<\(classString):\(itemIDString)> \(frameString)]"
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

    public func makeDebugViews(in parentView: UIView) {
        removeDebugViews(in: parentView)
        makeDebugViews(in: parentView, coordinateSpaceView: parentView)
    }

    private func makeDebugViews(in parentView: UIView, coordinateSpaceView: UIView) {
        let rect = coordinateSpaceView.convert(frame, to: parentView)
        let debugView = makeDebugView(with: rect)
        parentView.addSubview(debugView)

        for subItem in subItems {
            if requiresView {
                subItem.makeDebugViews(in: debugView, coordinateSpaceView: debugView)
            } else {
                subItem.makeDebugViews(in: debugView, coordinateSpaceView: coordinateSpaceView)
            }
        }

    }

    private func makeDebugView(with rect: CGRect) -> UIView {
        let view = UIView()
        view.itemKitID = "com.itemkit.debugview"
        view.layer.borderColor = UIColor.random.cgColor
        view.layer.borderWidth = 1
        view.frame = rect
        return view
    }

    private func removeDebugViews(in view: UIView) {
        // remove all previously created subviews
        for subview in view.subviews {
            removeDebugViews(in: subview)
            if subview.itemKitID != nil {
                subview.removeFromSuperview()
            }
        }
    }
}

extension CGFloat {
    fileprivate var formatted: String {
        return String(format: "%.2f", self)
    }
}

extension CGRect {
    fileprivate var formatted: String {
        let originString = "x: (\(origin.x.formatted), y: \(origin.y.formatted))"
        let sizeString = "w: \(size.width.formatted), h: \(size.height.formatted)"
        return "(\(originString), \(sizeString))"
    }
}
