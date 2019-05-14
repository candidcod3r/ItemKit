//
//  TextViewItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 5/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

// MARK: - TextViewItem

/**
 TextItem that has a backing UITextView.
 */
open class TextViewItem<View: UITextView>: GenericTextViewItem<View> {
    open override func configure() {
        configureView?(view)
        view.configure(with: self)
    }
}

// MARK: - LabelViewItem

/**
 TextItem that has a backing UILabel.
 */
open class LabelViewItem<View: UILabel>: GenericTextViewItem<View> {
    open override func configure() {
        configureView?(view)
        view.configure(with: self)
    }
}

// MARK: - TextFieldViewItem

/**
 TextItem that has a backing UITextField.
 */
open class TextFieldViewItem<View: UITextField>: GenericTextViewItem<View> {
    open override func configure() {
        configureView?(view)
        view.configure(with: self)
    }
}

// MARK: - GenericTextViewItem

/**
 TextItem that has a backing UIView.
 */
open class GenericTextViewItem<View: UIView>: TextItem, ViewItemable {
    open private(set) var view: View
    open private(set) var makeView: (() -> View)?
    open var configureView: ((View) -> Void)?

    // MARK: - Designated intializer

    public init(id: String? = nil,
                text: Text? = nil,
                font: UIFont? = nil,
                numberOfLines: Int = 0,
                textContainerInsets: UIEdgeInsets = .zero,
                lineFragmentPadding: CGFloat = 0,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                makeView: (() -> View)? = nil) {
        self.view = makeView?() ?? ViewItem.makeView()

        super.init(
            id: id,
            text: text,
            font: font,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility)
    }

    // MARK: - Convenience intializers

    public convenience init(id: String? = nil,
                            text: String,
                            font: UIFont? = nil,
                            numberOfLines: Int = 0,
                            textContainerInsets: UIEdgeInsets = .zero,
                            lineFragmentPadding: CGFloat = 0,
                            sizeGuide: SizeGuide = SizeGuide(),
                            insets: UIEdgeInsets = .zero,
                            alignment: Alignment = .leadingTop,
                            flexibility: Flexibility = .normal,
                            makeView: (() -> View)? = nil) {
        self.init(
            id: id,
            text: .normal(text),
            font: font,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            makeView: makeView)
    }

    public convenience init(id: String? = nil,
                            text: NSAttributedString,
                            font: UIFont? = nil,
                            numberOfLines: Int = 0,
                            textContainerInsets: UIEdgeInsets = .zero,
                            lineFragmentPadding: CGFloat = 0,
                            sizeGuide: SizeGuide = SizeGuide(),
                            insets: UIEdgeInsets = .zero,
                            alignment: Alignment = .leadingTop,
                            flexibility: Flexibility = .normal,
                            makeView: (() -> View)? = nil) {
        self.init(
            id: id,
            text: .attributed(text),
            font: font,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
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
