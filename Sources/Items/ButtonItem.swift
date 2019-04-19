//
//  ButtonItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct ButtonItem: InternalItemProtocol, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [ItemProtocol]
    
    public internal(set) var frame: CGRect = .zero
    public internal(set) var fittingSize: CGSize = .zero
    public internal(set) var contentFittingSize: CGSize = .zero

    // MARK:- Internal
    var withinFrame: CGRect = .zero
    
    // MARK:- ButtonItem Properties
    public var title: Text?
    public var image: UIImage?
    public var font: UIFont
    public var contentInsets: UIEdgeInsets
    public var titleInsets: UIEdgeInsets
    public var imageInsets: UIEdgeInsets
    
    // MARK:- Designated intializer
    public init(id: String? = nil,
                title: Text? = nil,
                image: UIImage? = nil,
                font: UIFont? = nil,
                contentInsets: UIEdgeInsets = .zero,
                titleInsets: UIEdgeInsets = .zero,
                imageInsets: UIEdgeInsets = .zero,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.id = id
        self.title = title
        self.image = image
        self.font = font ?? UIFont.buttonTitle
        self.contentInsets = contentInsets
        self.titleInsets = titleInsets
        self.imageInsets = imageInsets
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = []
    }
    
    // MARK:- Convenience intializers
    public init(id: String? = nil,
                title: String,
                image: UIImage? = nil,
                font: UIFont? = nil,
                contentInsets: UIEdgeInsets = .zero,
                titleInsets: UIEdgeInsets = .zero,
                imageInsets: UIEdgeInsets = .zero,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            title: Text.simple(title),
            image: image,
            font: font,
            contentInsets: contentInsets,
            titleInsets: titleInsets,
            imageInsets: imageInsets,
            insets: insets,
            sizeGuide: sizeGuide,
            alignment: alignment,
            flexibility: flexibility)
    }
    
    public init(id: String? = nil,
                title: NSAttributedString,
                image: UIImage? = nil,
                font: UIFont? = nil,
                contentInsets: UIEdgeInsets = .zero,
                titleInsets: UIEdgeInsets = .zero,
                imageInsets: UIEdgeInsets = .zero,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal) {
        self.init(
            id: id,
            title: Text.attributed(title),
            image: image,
            font: font,
            contentInsets: contentInsets,
            titleInsets: titleInsets,
            imageInsets: imageInsets,
            insets: insets,
            sizeGuide: sizeGuide,
            alignment: alignment,
            flexibility: flexibility)
    }
}

// MARK:- Measurable
extension ButtonItem {
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
        let imageSize = self.imageSize
            .insetted(by: imageInsets)
            .decreased(to: maxSize)
        
        let titleSize = self.titleSize(within: maxSize)
            .insetted(by: titleInsets)
        
        let contentWidth = imageSize.width + titleSize.width
        let contentHeight = max(imageSize.height, titleSize.height)
        let contentSize = CGSize(width: contentWidth, height: contentHeight)
            .insetted(by: contentInsets)
            .decreased(to: maxSize)
        
        return contentSize
    }
    
    private func titleSize(within maxSize: CGSize) -> CGSize {
        return title?.size(with: font, within: maxSize) ?? .zero
    }
    
    private var imageSize: CGSize {
        return image?.size ?? .zero
    }
}

// MARK:- Layoutable
extension ButtonItem {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
    }
}
