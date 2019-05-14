//
//  Item.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class Item: Itemable, Cacheable {

    // MARK: - Itemable Properties

    public let id: String?
    open var insets: UIEdgeInsets
    open var sizeGuide: SizeGuide
    open var alignment: Alignment
    open var flexibility: Flexibility
    open var subItems: [Itemable]

    // MARK: - Autocomputed properties

    open var frame: CGRect = .zero
    open var fittingSize: CGSize = .zero
    open var contentFittingSize: CGSize = .zero

    // MARK: - Designated intializer

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

    open var requiresView: Bool {
        return (id?.count ?? 0) > 0
    }

    // MARK: - Measurable

    public final func updateFittingSizes(within maxSize: CGSize) {
        // adjust maxSize according to the size guide
        let maxFittingSize = Sizer.fittingSize(within: maxSize, using: sizeGuide)

        // decrease by insets so that the content takes the decreased size
        let maxContentSize = maxFittingSize.decreased(by: insets)

        // compute the content fitting size
        contentFittingSize = self.contentFittingSizes(within: maxContentSize)

        let itemFittingSize = contentFittingSize.increased(by: insets)
        fittingSize = Sizer.size(from: itemFittingSize, fittingSize: maxFittingSize, using: sizeGuide)
    }

    open func contentFittingSizes(within maxSize: CGSize) -> CGSize {
        for i in 0..<subItems.count {
            subItems[i].updateFittingSizes(within: maxSize)
        }
        return Sizer.fittingSize(within: maxSize, using: sizeGuide)
    }

    // MARK: - Layoutable

    public final func updateFrames(within maxFrame: CGRect) {
        let size = Sizer.size(of: fittingSize, within: maxFrame.size, using: sizeGuide)
        let origin = Aligner.origin(of: size, with: alignment, within: maxFrame)
        
        let itemFrame = CGRect(origin: origin, size: size)

        // update the content layout
        updateContentFrames(itemFrame: itemFrame)

        frame = itemFrame
    }

    open func updateContentFrames(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateFrames(within: maxFrame)
        }
    }

    private func updateContentFrames(itemFrame: CGRect) {
        let contentFrameOrigin = self.contentFrameOrigin(within: itemFrame)
        let contentFrameSize = itemFrame.size.decreased(by: insets)

        let maxContentFrame = CGRect(origin: contentFrameOrigin, size: contentFrameSize)
        updateContentFrames(within: maxContentFrame)
    }

    private func contentFrameOrigin(within maxFrame: CGRect) -> CGPoint {
        if requiresView {
            return CGPoint(x: insets.left, y: insets.top)
        } else {
            return CGPoint(x: maxFrame.origin.x + insets.left, y: maxFrame.origin.y + insets.top)
        }
    }
}

// MARK: - ViewItemable

open class ViewItem<View: UIView>: Item, ViewItemable {
    open var view = makeView()
    open var prepareView: ((View) -> Void)?

    open override var frame: CGRect {
        didSet {
            view.frame = frame
        }
    }

    // MARK: - Configurable

    open func configureView() {
        prepareView?(view)
        view.configure(with: self)
    }

    open override var requiresView: Bool {
        return true
    }
}
