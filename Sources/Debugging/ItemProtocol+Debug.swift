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
        let originString = "x: (\(frame.origin.x.formatted), y: \(frame.origin.y.formatted))"
        let sizeString = "w: \(frame.size.width.formatted), h: \(frame.size.height.formatted)"
        let itemIDString = id ?? "NO_ID"

        let descriptionString = "[<\(classString):\(itemIDString)>" + " (\(originString), \(sizeString))]"
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

    public func createDebugViews(in parentView: UIView) {
        removeDebugViews(in: parentView)
        createDebugViews(in: parentView, coordinateSpaceView: parentView)
    }

    private func createDebugViews(in parentView: UIView, coordinateSpaceView: UIView) {
        let rect = coordinateSpaceView.convert(frame, to: parentView)
        let debugView = createDebugView(with: rect)
        parentView.addSubview(debugView)
        
        for i in 0..<subItems.count {
            if requiresView {
                subItems[i].createDebugViews(in: debugView, coordinateSpaceView: debugView)
            } else {
                subItems[i].createDebugViews(in: debugView, coordinateSpaceView: coordinateSpaceView)
            }
        }

    }

    private func createDebugView(with rect: CGRect) -> UIView {
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
