//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import ItemKit

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()



public struct ImagePileItem: Itemable, Cacheable {
    // MARK:- ItemProtocol Properties
    public var id: String?
    public var insets: UIEdgeInsets
    public var sizeGuide: SizeGuide
    public var alignment: Alignment
    public var flexibility: Flexibility
    public var subItems: [Itemable]

    public var frame: CGRect = .zero
    public var fittingSize: CGSize = .zero
    public var contentFittingSize: CGSize = .zero

    // MARK:- Designated intializer
    public init(id: String? = nil,
                insets: UIEdgeInsets = .zero,
                sizeGuide: SizeGuide = SizeGuide(),
                alignment: Alignment = .leadingTop,
                flexibility: Flexibility = .normal,
                subItems: [Itemable] = []) {
        self.id = id
        self.insets = insets
        self.sizeGuide = sizeGuide
        self.alignment = alignment
        self.flexibility = flexibility
        self.subItems = subItems
    }
}

// MARK:- Measurable
extension ImagePileItem {
    public mutating func contentFittingSize(within maxSize: CGSize) -> CGSize {
        var contentFittingSize = CGSize.zero
        for i in 0..<subItems.count {
            subItems[i].updateFittingSize(within: maxSize)
            contentFittingSize = subItems[i].fittingSize

        }
        return Sizer.fittingSize(within: contentFittingSize, using: sizeGuide)
    }
}

// MARK:- Layoutable
extension ImagePileItem {
    public mutating func updateContentLayout(within maxFrame: CGRect) {
        for i in 0..<subItems.count {
            subItems[i].updateLayout(within: maxFrame)
        }
    }
}



