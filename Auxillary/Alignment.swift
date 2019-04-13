//
//  Alignment.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

import Foundation

public enum HorizontalAlignment {
    case leading
    case center
    case trailing
}

public enum VerticalAlignment {
    case top
    case center
    case bottom
}

public struct Alignment {
    public var horizontal: HorizontalAlignment
    public var vertical:VerticalAlignment

    public init(_ horizontal: HorizontalAlignment, _ vertical: VerticalAlignment) {
        self.horizontal = horizontal
        self.vertical = vertical
    }

    public static let leadingTop = Alignment(.leading, .top)
    public static let leadingBottom = Alignment(.leading, .bottom)
    public static let leadingCenter = Alignment(.leading, .center)

    public static let trailingTop = Alignment(.trailing, .top)
    public static let trailingBottom = Alignment(.trailing, .bottom)
    public static let trailingCenter = Alignment(.trailing, .center)

    public static let centerTop = Alignment(.center, .top)
    public static let centerBottom = Alignment(.center, .bottom)
    public static let center = Alignment(.center, .center)

    private static func verticalAlignment(from horizontalAlignment: HorizontalAlignment) -> VerticalAlignment {
        switch horizontalAlignment {
        case .leading:
            return .top
        case .trailing:
            return .bottom
        case .center:
            return .center
        }
    }

    private static func horizontalAlignment(from verticalAlignment: VerticalAlignment) -> HorizontalAlignment {
        switch verticalAlignment {
        case .top:
            return .leading
        case .bottom:
            return .trailing
        case .center:
            return .center
        }
    }

}
