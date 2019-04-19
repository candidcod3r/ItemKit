//
//  ItemProtocol.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol ItemProtocol: Measurable, Layoutable {
    var id: String? { get set }
    var insets: UIEdgeInsets { get set }
    var sizeGuide: SizeGuide { get set }
    var alignment: Alignment { get set }
    var flexibility: Flexibility { get set }
    var subItems: [ItemProtocol] { get set }
    
    var frame: CGRect { get }
    var fittingSize: CGSize { get }
    
    var requiresView: Bool { get }
}

extension ItemProtocol {
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0
    }
    
    public var origin: CGPoint {
        return frame.origin
    }

    public var size: CGSize {
        return frame.size
    }

    // MARK:- Measurable helper methods
    fileprivate mutating func updatedFittingSize(within maxSize: CGSize) -> CGSize {
        // adjust maxSize according to the size guide
        let maxFittingSize = Sizer.maxFittingSize(within: maxSize, using: sizeGuide)

        // decrease by insets so that the content takes the decreased size
        let maxContentSize = maxFittingSize.decreased(by: insets)

        // compute the content fitting size
        let contentFittingSize = self.contentFittingSize(within: maxContentSize)

        return contentFittingSize.increased(by: insets)
    }

    // MARK:- Layoutable helper methods
    fileprivate mutating func updatedFrame(within maxFrame: CGRect) -> CGRect {
        let size = Sizer.size(of: fittingSize, within: maxFrame.size, using: sizeGuide)
        let origin = Aligner.origin(of: size, with: alignment, within: maxFrame)

        let itemFrame = CGRect(origin: origin, size: size)

        // update the content layout
        updateContentLayout(itemFrame: itemFrame)

        return itemFrame
    }

    private mutating func updateContentLayout(itemFrame: CGRect) {
        let contentFrameOrigin = self.contentFrameOrigin(within: itemFrame)
        let contentFrameSize = itemFrame.size.decreased(by: insets)

        let maxContentFrame = CGRect(origin: contentFrameOrigin, size: contentFrameSize)
        updateContentLayout(within: maxContentFrame)
    }

    private func contentFrameOrigin(within maxFrame: CGRect) -> CGPoint {
        if requiresView {
            return CGPoint(x: insets.left, y: insets.top)
        } else {
            return CGPoint(x: maxFrame.origin.x + insets.left, y: maxFrame.origin.y + insets.top)
        }
    }
}

/**
 Internal protocol for ItemProtocol to access the setters for stored properties
 */
protocol InternalItemProtocol: ItemProtocol {
    var frame: CGRect { get set }
    var fittingSize: CGSize { get set }

    // MARK:- Internal properties

    // used for debugging purposes
    var withinFrame: CGRect { get set }
}

extension InternalItemProtocol {
    // MARK:- Measurable
    public mutating func updateFittingSize(within maxSize: CGSize) {
        fittingSize = self.updatedFittingSize(within: maxSize)
    }

    // MARK:- Layoutable
    public mutating func updateLayout(within maxFrame: CGRect) {
        // update withinFrame
        withinFrame = maxFrame

        // update the fitting size
        updateFittingSize(within: maxFrame.size)

        frame = updatedFrame(within: maxFrame)
    }
}
