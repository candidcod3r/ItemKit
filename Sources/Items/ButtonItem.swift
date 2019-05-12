//
//  ButtonItem.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

open class ButtonItem: Item {
    // MARK:- ButtonItem Properties
    open var title: Text?
    open var image: UIImage?
    open var imageSize: CGSize
    open var font: UIFont
    open var contentInsets: UIEdgeInsets
    open var titleInsets: UIEdgeInsets
    open var imageInsets: UIEdgeInsets
    
    // MARK:- Designated intializer
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
                flexibility: Flexibility = .normal) {
        self.title = title
        self.image = image
        self.imageSize = image?.size ?? imageSize
        self.font = font ?? UIFont.buttonTitle
        self.contentInsets = contentInsets
        self.titleInsets = titleInsets
        self.imageInsets = imageInsets

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
                            flexibility: Flexibility = .normal) {
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
            flexibility: flexibility)
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
                            flexibility: Flexibility = .normal) {
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
            flexibility: flexibility)
    }

    // MARK:- Measurable
    open override func contentFittingSize(within maxSize: CGSize) -> CGSize {
        let imageSize = self.buttonImageSize
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

    // MARK:- Private helpers
    private func titleSize(within maxSize: CGSize) -> CGSize {
        return title?.size(with: font, within: maxSize) ?? .zero
    }
    
    private var buttonImageSize: CGSize {
        return image?.size ?? imageSize
    }
}

// MARK:- ViewItemable
open class ButtonViewItem<View: UIButton>: ButtonItem, ViewItemable {
    // MARK:- Backing view
    open var view: View?
}
