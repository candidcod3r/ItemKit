//
//  TextItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class TextItem: Item {
    // MARK:- TextItem Properties
    open var text: Text
    open var font: UIFont
    open var numberOfLines: Int
    open var textContainerInsets: UIEdgeInsets
    open var lineFragmentPadding: CGFloat

    // MARK:- Designated intializer
    public init(id: String? = nil,
                text: Text? = nil,
                font: UIFont? = nil,
                numberOfLines: Int = 0,
                textContainerInsets: UIEdgeInsets = .zero,
                lineFragmentPadding: CGFloat = 0,
                sizeGuide: SizeGuide = SizeGuide(),
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.text = text ?? .normal("")
        self.font = font ?? UIFont.label
        self.numberOfLines = max(numberOfLines, 0)
        self.textContainerInsets = textContainerInsets
        self.lineFragmentPadding = lineFragmentPadding

        super.init(
            id: id,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility,
            subItems: [])
    }

    // MARK:- Convenience intializers
    public convenience init(id: String? = nil,
                            text: String,
                            font: UIFont? = nil,
                            numberOfLines: Int = 0,
                            textContainerInsets: UIEdgeInsets = .zero,
                            lineFragmentPadding: CGFloat = 0,
                            sizeGuide: SizeGuide = SizeGuide(),
                            insets: UIEdgeInsets = .zero,
                            alignment: Alignment = .leadingTop,
                            flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            text: .normal(text),
            font: font ?? UIFont.label,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility)
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
                            flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            text: .attributed(text),
            font: font ?? UIFont.label,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            sizeGuide: sizeGuide,
            insets: insets,
            alignment: alignment,
            flexibility: flexibility)
    }

    // MARK:- Measurable
    open override func contentFittingSizes(within maxSize: CGSize) -> CGSize {
        let lineFragmentInsets = UIEdgeInsets(horizontal: lineFragmentPadding)
        let maxTextSize = maxSize
            .decreased(by: textContainerInsets)
            .decreased(by: lineFragmentInsets)

        let maxPermissibleLinesHeight = self.maxPermissibleLinesHeight()
        let textSize = text.size(with: font, within: maxTextSize)

        let adjustedTextContainerInsets = textSize.height > maxPermissibleLinesHeight
            ? textContainerInsets.removedBottom()
            : textContainerInsets

        let textAreaSize = CGSize(width: textSize.width, height: min(textSize.height, maxPermissibleLinesHeight))

        let size = textAreaSize
            .increased(by: adjustedTextContainerInsets)
            .increased(by: lineFragmentInsets)
        return size
    }

    private func maxPermissibleLinesHeight() -> CGFloat {
        guard numberOfLines > 0 && numberOfLines != Int.max else {
            return CGFloat.greatestFiniteMagnitude
        }

        let totalLinesHeight = CGFloat(numberOfLines) * font.lineHeight
        let maxHeight = totalLinesHeight.roundedUp
        return maxHeight
    }
}

// MARK:- ViewItemable
open class TextViewItem<View: UITextView>: TextItem, ViewItemable {
    open var view = makeView()
    open var prepareView: ((View) -> Void)?

    // MARK:- Configurable
    open func configureView() {
        prepareView?(view)
        view.configure(with: self)
    }

    open override var requiresView: Bool {
        return true
    }
}


// MARK:- ViewItemable
open class LabelViewItem<View: UILabel>: TextItem, ViewItemable {
    open var view = makeView()
    open var prepareView: ((View) -> Void)?

    // MARK:- Configurable
    open func configureView() {
        prepareView?(view)
        view.configure(with: self)
    }

    open override var requiresView: Bool {
        return true
    }
}

open class TextFieldViewItem<View: UITextField>: TextItem, ViewItemable {
    open var view = makeView()
    open var prepareView: ((View) -> Void)?

    // MARK:- Configurable
    open func configureView() {
        prepareView?(view)
        view.configure(with: self)
    }

    open override var requiresView: Bool {
        return true
    }
}
