//
//  ItemProtocol.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public protocol ItemProtocol {
    var id: String? { get set }
    var insets: UIEdgeInsets { get set }
    var sizeGuide: SizeGuide { get set }
    var alignment: Alignment { get set }
    var flexibility: Flexibility { get set }
    var subItems: [Self] { get set }

    var origin: CGPoint { get }
    var measurement: CGSize { get }

    var parentFrame: CGRect { get }

    var requiresView: Bool { get }
    var frame: CGRect { get }
}

extension ItemProtocol {
    public var requiresView: Bool {
        return (id?.count ?? 0) > 0
    }

    public var frame: CGRect {
        return CGRect(origin: origin, size: measurement)
    }
}