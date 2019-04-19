//
//  TextItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct TextItem: InternalItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public internal(set) var frame: CGRect = .zero
    public internal(set) var fittingSize: CGSize = .zero
    var withinFrame: CGRect = .zero

    // MARK:- TextItem Properties
    public var text: Text
    public var font: UIFont
    public var numberOfLines: Int
    public var textContainerInsets: UIEdgeInsets
    public var lineFragmentPadding: CGFloat

    // MARK:- Designated intializer
    public init(id: String? = nil,
                text: Text,
                font: UIFont? = nil,
                numberOfLines: Int = 0,
                textContainerInsets: UIEdgeInsets = .zero,
                lineFragmentPadding: CGFloat = 0,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.id = id
        self.text = text
        self.font = font ?? UIFont.label
        self.numberOfLines = max(numberOfLines, 0)
        self.textContainerInsets = textContainerInsets
        self.lineFragmentPadding = lineFragmentPadding
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = []
    }

    // MARK:- Convenience intializers
    public init(id: String? = nil,
                text: String,
                font: UIFont? = nil,
                numberOfLines: Int = 0,
                textContainerInsets: UIEdgeInsets = .zero,
                lineFragmentPadding: CGFloat = 0,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            text: Text.simple(text),
            font: font ?? UIFont.label,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            insets: insets,
            sizeGuide: sizeGuide,
            alignment: alignment,
            flexibility: flexibility)
    }

    public init(id: String? = nil,
                text: NSAttributedString,
                font: UIFont? = nil,
                numberOfLines: Int = 0,
                textContainerInsets: UIEdgeInsets = .zero,
                lineFragmentPadding: CGFloat = 0,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            text: Text.attributed(text),
            font: font ?? UIFont.label,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            insets: insets,
            sizeGuide: sizeGuide,
            alignment: alignment,
            flexibility: flexibility)
    }
}

// MARK:- Measurable
extension TextItem {
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
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

        let size: CGSize = textAreaSize
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

// MARK:- Layoutable
extension TextItem {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
    }
}
