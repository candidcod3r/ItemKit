import UIKit
import PlaygroundSupport
import ItemKit

let rootView: UIView = {
    let view = UIView()
    view.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
    view.backgroundColor = .white
    PlaygroundPage.current.liveView = view
    return view
}()

let heartItem = Item(
    id: "heart",
    sizeGuide: SizeGuide(width: .fixed(24), height: .fixed(24)),
    insets: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4),
    alignment: .trailingTop)

let imageItem = Item(
    id: "image",
    sizeGuide: SizeGuide(width: .fill, height: .fixed(300)))


let categoryItem = TextItem(
    id: "category",
    text: "SHOPPING",
    numberOfLines: 1,
    sizeGuide: SizeGuide(width: .fill))

let titleItem = TextItem(
    id: "title",
    text: "Amazing night walk in the streets of down town",
    numberOfLines: 2,
    sizeGuide: SizeGuide(width: .fill))

let descriptionItem = TextItem(
    id: "description",
    text: "2 Hours • 1 Meal • Drinks included",
    sizeGuide: SizeGuide(width: .fill))

let priceItem = TextItem(
    id: "price",
    text: "$36 per person",
    sizeGuide: SizeGuide(width: .fill))

let ratingItem = TextItem(
    id: "rating",
    text: "5 stars",
    sizeGuide: SizeGuide(width: .fill))


let topStackItem = StackItem(
    axis: .vertical,
    spacing: 8,
    sizeGuide: SizeGuide(width: .fill),
    alignment: .centerTop,
    subItems: [categoryItem, titleItem, descriptionItem])

let bottomStackItem = StackItem(
    axis: .vertical,
    spacing: 8,
    sizeGuide: SizeGuide(width: .fill),
    alignment: .centerBottom,
    subItems: [priceItem, ratingItem])

let rightItem = StackItem(
    axis: .vertical,
    distribution: .fillExtraSpace,
    sizeGuide: SizeGuide(width: .fill, height: .fill),
    subItems: [topStackItem, bottomStackItem])

let leftItem = CanvasItem(
    primaryItem: imageItem,
    subItems: [heartItem])

let stackItem = StackItem(
    axis: .horizontal,
    spacing: 8,
    distribution: .equalSize,
    sizeGuide: SizeGuide(width: .fill),
    insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
    subItems: [leftItem, rightItem])

let item = stackItem
item.updateLayout(within: rootView.bounds)
print(item.debugDescription())
item.makeDebugViews(in: rootView)
