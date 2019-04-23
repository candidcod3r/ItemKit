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

let backgroundImageItem = Item(
    id: "backgroundImage",
    sizeGuide: SizeGuide(width: .fill, height: .fixed(76)))

let actionButtonItem = ButtonItem(
    id: "actionButton",
    title: "follow",
    insets: UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4),
    alignment: .trailingTop)

let titleItem = TextItem(
    id: "title",
    text: "Candid Cod3r",
    numberOfLines: 1,
    sizeGuide: SizeGuide(width: .fill))

let headlineItem = TextItem(
    id: "headline",
    text: "Make world a better place",
    numberOfLines: 1,
    sizeGuide: SizeGuide(width: .fill))

let subtitleItem = TextItem(
    id: "subtitle",
    text: "500+ connections",
    numberOfLines: 1,
    sizeGuide: SizeGuide(width: .fill))

let profileImageItem = Item(
    id: "profileImage",
    sizeGuide: SizeGuide(width: .fill, height: .fill))

let presenceItem = Item(
    id: "presence",
    sizeGuide: SizeGuide(width: .fixed(10), height: .fixed(10)),
    alignment: .trailingBottom)

let profileImageContainerItem = Item(
    sizeGuide: SizeGuide(width: .fixed(60), height: .fixed(60)),
    alignment: Alignment(
        horizontal: .leading,
        vertical: .top,
        offset: UIOffset(horizontal: 8, vertical: 76 - 30)),
    subItems: [profileImageItem, presenceItem])

let textStackItem = StackItem(
    axis: .vertical,
    spacing: 4,
    sizeGuide: SizeGuide(width: .fill),
    subItems: [
        titleItem,
        headlineItem,
        subtitleItem])

let bottomStackItem = StackItem(
    axis: .vertical,
    spacing: 20,
    sizeGuide: SizeGuide(width: .fill),
    insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8),
    subItems: [
        actionButtonItem,
        textStackItem])

let stackItem = StackItem(
    axis: .vertical,
    sizeGuide: SizeGuide(width: .fill),
    subItems: [backgroundImageItem, bottomStackItem])

let profileCardItem = CanvasItem(
    sizeGuide: SizeGuide(width: .fill),
    primaryItem: stackItem,
    subItems: [profileImageContainerItem])

profileCardItem.updateLayout(within: rootView.bounds)
print(profileCardItem.debugDescription())
profileCardItem.makeDebugViews(in: rootView)
