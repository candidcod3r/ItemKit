//
//  TextItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct TextItem: ItemProtocol, Cacheable {

    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]

    public internal(set) var origin: CGPoint = .zero
    public internal(set) var measurement: CGSize = .zero

    // MARK:- TextItem Properties
    var text: Text
    public var font: UIFont
    public var numberOfLines: Int
    public var textContainerInsets: UIEdgeInsets
    public var lineFragmentPadding: CGFloat

    // MARK:- Designated intializer
    init(id: String? = nil,
         text: Text,
         font: UIFont = UIFont.defaultLabel,
         numberOfLines: Int = 0,
         textContainerInsets: UIEdgeInsets = .zero,
         lineFragmentPadding: CGFloat = 0,
         insets: UIEdgeInsets = .zero,
         sizeGuide: SizeGuide = SizeGuide(),
         alignment: Alignment = .leadingTop,
         flexibility: Flexibility = .normal) {
        self.id = id
        self.text = text
        self.font = font
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
            font: font ?? UIFont.defaultLabel,
            numberOfLines: numberOfLines,
            textContainerInsets: textContainerInsets,
            lineFragmentPadding: lineFragmentPadding,
            insets: insets,
            sizeGuide: sizeGuide,
            alignment: alignment,
            flexibility: flexibility)
    }

    public init(id: String? = nil,
                attributedText: NSAttributedString,
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
            text: Text.attributed(attributedText),
            font: font ?? UIFont.defaultLabel,
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

    public mutating func updateMeasurements(within maxSize: CGSize) {
        measurement = measurementByUpdatingContentMeasurements(within: maxSize)
    }

    @discardableResult
    public mutating func contentMeasurementByUpdatingSubItemsMeasurements(within maxSize: CGSize) -> CGSize {
        let lineFragmentInsets = UIEdgeInsets(horizontal: lineFragmentPadding)
        let maxTextSize = maxSize
            .decreased(by: textContainerInsets)
            .decreased(by: lineFragmentInsets)

        let textSize = self.textSize(within: maxTextSize)

        let size: CGSize = textSize
            .increased(by: textContainerInsets)
            .increased(by: lineFragmentInsets)
        return size
    }

    private func textSize(within maxSize: CGSize) -> CGSize {
        let maxAllowableLinesHeight = self.maxAllowableLinesHeight()
        let size = text.size(with: font, within: maxSize)

        return CGSize(width: size.width, height: min(size.height, maxAllowableLinesHeight))
    }

    private func maxAllowableLinesHeight() -> CGFloat {
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
    public mutating func updateAlignments(within maxFrame: CGRect) {
        origin = originByUpdatingContentAlignments(within: maxFrame)
    }

    public mutating func updateContentAlignments(contentFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateAlignments(within: contentFrame)
        }
    }
}

