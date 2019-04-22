//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport
import ItemKit

let rootView: UIView = {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
    view.backgroundColor = .lightText
    PlaygroundPage.current.liveView = view
    return view
}()

public class ImagesRollupItem: StackItem {
    struct Constant {
        static let subItemIDPrefix = "rollupItem"
    }

    // MARK:- Designated intializer
    public init(id: String,
                imagesCount: Int,
                imageSize: CGSize,
                insets: UIEdgeInsets = .zero,
                alignment: Alignment = .leadingTop) {
        let subItemSizeGuide = SizeGuide(
            width: .fixed(imageSize.width),
            height: .fixed(imageSize.height))
        let imageItems: [Itemable] = (imagesCount <= 0)
            ? []
            : (0..<imagesCount).map { (index) in
                return Item(
                    id: Constant.subItemIDPrefix + "\(index)",
                    sizeGuide: subItemSizeGuide)}

        super.init(
            id: id,
            spacing: -imageSize.width/2,
            sizeGuide: SizeGuide(width: .fit, height: .fit),
            insets: insets,
            alignment: alignment,
            flexibility: Flexibility.low,
            subItems: imageItems)
    }
}

class ImagesRollupView: UIView {
    let imageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar1")
        return imageView
    }()

    let imageView3: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar2")
        return imageView
    }()

    let imageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avatar3")
        return imageView
    }()

    public var imageRadius: CGFloat

    private var imageViews: [UIImageView] {
        return [imageView1, imageView2, imageView3]
    }

    init(imageRadius: CGFloat) {
        self.imageRadius = imageRadius

        super.init(frame: .zero)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        imageViews.forEach(addSubview)
        imageViews.forEach { configure(imageView: $0) }
    }

    func configure(withImagesRollupItem imagesRollupItem: ImagesRollupItem?) {
        guard let imagesRollupItem = imagesRollupItem else {
            return
        }

        configure(withItem: imagesRollupItem)
        for (subview, subItem) in zip(subviews, imagesRollupItem.subItems) {

            subview.configure(withItem: subItem)
        }
    }

    private func configure(imageView: UIImageView) {
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = imageRadius
        imageView.layer.masksToBounds = true
    }
}

let rollupItem = ImagesRollupItem(
    id: "imagesRollupItem",
    imagesCount: 3,
    imageSize: CGSize(width: 50, height: 50),
    alignment: .center)

rollupItem.updateLayout(within: rootView.bounds)
print(rollupItem.debugDescription())

let imagesRollupview = ImagesRollupView(imageRadius: 25)
rootView.addSubview(imagesRollupview)
imagesRollupview.configure(withImagesRollupItem: rollupItem)
imagesRollupview.updateLayout(with: rollupItem)
