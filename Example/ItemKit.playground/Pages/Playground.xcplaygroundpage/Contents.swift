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

let backgroundImageItem = Item(
    id: "backgroundImage",
    sizeGuide: SizeGuide(width: .fill, height: .fixed(76)),
    alignment: .leadingTop)

let item = backgroundImageItem
item.updateLayout(within: rootView.bounds)
print(item.debugDescription())
item.makeDebugViews(in: rootView)
