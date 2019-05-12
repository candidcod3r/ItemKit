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

let textItem = TextViewItem(
    text: "Great going",
    alignment: .center)
textItem.view = {
    let view = UITextView()
    view.textColor = .black
    return view
}()

let backgroundImageItem = ViewItem(
    sizeGuide: SizeGuide(width: .fill, height: .fixed(76)),
    alignment: .leadingTop,
    subItems: [textItem])
backgroundImageItem.view = {
    let view = UIView()
    view.backgroundColor = .cyan
    return view
}()


var item = backgroundImageItem
item.configureView()
item.layoutViews(within: rootView)
print(item.debugDescription())
