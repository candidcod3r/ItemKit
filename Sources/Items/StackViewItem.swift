//
//  StackViewItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

/**
 StackItem that has a backing UIView.
 */
open class StackViewItem<View: UIView>: StackItem, ViewItemable {
    open private(set) var view: View
    open private(set) var makeView: (() -> View)?
    open var configureView: ((View) -> Void)?

    // MARK: - Designated intializer

    public init(id: String? = nil,
                axis: Axis = .horizontal,
                spacing: CGFloat = 0,
                distribution: StackDistribution = .leading,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility? = nil,
                subItems: [Itemable] = [],
                makeView: (() -> View)? = nil) {
        self.view = makeView?() ?? ViewItem.makeView()

        super.init(
            id: id,
            axis: axis,
            spacing: spacing,
            distribution: distribution,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
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
