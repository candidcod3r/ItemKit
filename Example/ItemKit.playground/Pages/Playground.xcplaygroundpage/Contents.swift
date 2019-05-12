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

let textView: UITextView = {
    let view = UITextView()
    view.textColor = .black
    return view
}()

let textItem = TextItem(
    text: "Great going",
    alignment: .center)
textItem.itemView = textView

let backgroundImageView: UIView = {
    let view = UIView()
    view.backgroundColor = .cyan
    return view
}()

let backgroundImageItem = Item(
    sizeGuide: SizeGuide(width: .fill, height: .fixed(76)),
    alignment: .leadingTop,
    subItems: [textItem])
backgroundImageItem.itemView = backgroundImageView


var item = backgroundImageItem
item.layoutViews(within: rootView)
print(item.debugDescription())
