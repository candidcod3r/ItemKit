//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public typealias Item = ViewItem<UIView>

open class ViewItem<View: UIView>: Itemable, Cacheable {
    // MARK:- Itemable Properties
    public let id: String?
    open var insets: UIEdgeInsets
    open var sizeGuide: SizeGuide
    open var alignment: Alignment
    open var flexibility: Flexibility
    open var subItems: [Itemable]

    // MARK:- autocomputed properties
    open var frame: CGRect = .zero
    open var fittingSize: CGSize = .zero
    open var contentFittingSize: CGSize = .zero

    // MARK:- Backing view
    open var view: View?

    // MARK:- Designated intializer
    public init(id: String? = nil,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                subItems: [Itemable] = []) {
        self.id = id
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = subItems
    }

    // MARK:- Measurable
    open func updateFittingSize(within maxSize: CGSize) {
        // adjust maxSize according to the size guide
        let maxFittingSize = Sizer.fittingSize(within: maxSize, using: sizeGuide)

        // decrease by insets so that the content takes the decreased size
        let maxContentSize = maxFittingSize.decreased(by: insets)

        // compute the content fitting size
        contentFittingSize = self.contentFittingSize(within: maxContentSize)

        fittingSize = contentFittingSize.increased(by: insets)
    }

    open func contentFittingSize(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
        }
        return Sizer.fittingSize(within: maxSize, using: sizeGuide)
    }

    // MARK:- Layoutable
    open func updateLayout(within maxFrame: CGRect) {
        // update the fitting size
        updateFittingSize(within: maxFrame.size)

        let size = Sizer.size(of: fittingSize, within: maxFrame.size, using: sizeGuide)
        let origin = Aligner.origin(of: size, with: alignment, within: maxFrame)
        
        let itemFrame = CGRect(origin: origin, size: size)

        // update the content layout
        updateContentLayout(itemFrame: itemFrame)

        frame = itemFrame
    }

    open func updateContentLayout(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayout(within: maxFrame)
        }
    }

    private func updateContentLayout(itemFrame: CGRect) {
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

    // MARK:- Configurable
    open func configureView() {
        view?.configure(with: self)
        for subItem in subItems {
            subItem.configureView()
        }
    }
}

// MARK- Itemable
extension ViewItem {
    open var itemView: UIView? {
        return view
    }
}
