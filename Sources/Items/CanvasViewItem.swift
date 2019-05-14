//
//  CanvasViewItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

/**
 CanvasItem that has a backing UIView.
 */
open class CanvasViewItem<View: UIView>: CanvasItem, ViewItemable {
    open private(set) var view: View
    open private(set) var makeView: (() -> View)?
    open var configureView: ((View) -> Void)?

    // MARK: - Designated intializer

    public init(id: String? = nil,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                primaryItem: Itemable,
                subItems: [Itemable] = [],
                makeView: (() -> View)? = nil) {
        self.view = makeView?() ?? ViewItem.makeView()

        super.init(
            id: id,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            primaryItem: primaryItem,
            subItems: subItems)

    }
    // MARK: - Configurable

    open func configure() {
        configureView?(view)
        view.configure(with: self)
    }

    open override var requiresView: Bool {
        return true
    }
}
