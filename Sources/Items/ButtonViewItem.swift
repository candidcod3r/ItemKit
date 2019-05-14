//
//  ButtonViewItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

/**
 ButtonItem that has a backing UIButton.
 */
open class ButtonViewItem<View: UIButton>: ButtonItem, ViewItemable {
    open private(set) var view: View
    open private(set) var makeView: (() -> View)?
    open var configureView: ((View) -> Void)?

    // MARK: - Designated intializer

    public init(id: String? = nil,
                title: Text? = nil,
                image: UIImage? = nil,
                imageSize: CGSize = .zero,
                font: UIFont? = nil,
                contentInsets: UIEdgeInsets = .zero,
                titleInsets: UIEdgeInsets = .zero,
                imageInsets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                makeView: (() -> View)? = nil) {
        self.view = makeView?() ?? ViewItem.makeView()

        super.init(id: id,
                   title: title,
                   image: image,
                   imageSize: imageSize,
                   font: font,
                   contentInsets: contentInsets,
                   titleInsets: titleInsets,
                   imageInsets: imageInsets,
                   sizeGuide: sizeGuide,
                   insets: insets,
                   alignment: alignment,
                   flexibility: flexibility)
    }

    // MARK: - Convenience intializers

    public convenience init(id: String? = nil,
                            title: String,
                            image: UIImage? = nil,
                            imageSize: CGSize = .zero,
                            font: UIFont? = nil,
                            contentInsets: UIEdgeInsets = .zero,
                            titleInsets: UIEdgeInsets = .zero,
                            imageInsets: UIEdgeInsets = .zero,
                            sizeGuide: SizeGuide = SizeGuide(),
                            insets: UIEdgeInsets = .zero,
                            alignment: Alignment = .leadingTop,
                            flexibility: Flexibility = .normal,
                            makeView: (() -> View)? = nil) {
        self.init(
            id: id,
            title: .normal(title),
            image: image,
            imageSize: imageSize,
            font: font,
            contentInsets: contentInsets,
            titleInsets: titleInsets,
            imageInsets: imageInsets,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            makeView: makeView)
    }

    public convenience init(id: String? = nil,
                            title: NSAttributedString,
                            image: UIImage? = nil,
                            imageSize: CGSize = .zero,
                            font: UIFont? = nil,
                            contentInsets: UIEdgeInsets = .zero,
                            titleInsets: UIEdgeInsets = .zero,
                            imageInsets: UIEdgeInsets = .zero,
                            sizeGuide: SizeGuide = SizeGuide(),
                            insets: UIEdgeInsets = .zero,
                            alignment: Alignment = .leadingTop,
                            flexibility: Flexibility = .normal,
                            makeView: (() -> View)? = nil) {
        self.init(
            id: id,
            title: .attributed(title),
            image: image,
            imageSize: imageSize,
            font: font,
            contentInsets: contentInsets,
            titleInsets: titleInsets,
            imageInsets: imageInsets,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            makeView: makeView)
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
