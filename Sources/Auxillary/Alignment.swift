//
//  Alignment.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public enum HorizontalAlignment {
    case leading
    case center
    case trailing

    public func offet(with dimension: CGFloat, within maxDimension: CGFloat) -> CGFloat {
        let excessDimension = max(maxDimension - dimension, 0)
        switch self {
        case .leading:
            return 0
        case .trailing:
            return excessDimension
        case .center:
            return excessDimension / 2.0
        }
    }
}

public enum VerticalAlignment {
    case top
    case center
    case bottom

    public func offet(with dimension: CGFloat, within maxDimension: CGFloat) -> CGFloat {
        let excessDimension = max(maxDimension - dimension, 0)
        switch self {
        case .top:
            return 0
        case .bottom:
            return excessDimension
        case .center:
            return excessDimension / 2.0
        }
    }
}

public struct Alignment {
    public var horizontal: HorizontalAlignment
    public var vertical:VerticalAlignment
    public var offset: UIOffset

    public init(horizontal: HorizontalAlignment,
                vertical: VerticalAlignment,
                offset: UIOffset = .zero) {
        self.horizontal = horizontal
        self.vertical = vertical
        self.offset = offset
    }

    public static let leadingTop = Alignment(horizontal: .leading, vertical: .top)
    public static let leadingBottom = Alignment(horizontal: .leading, vertical: .bottom)
    public static let leadingCenter = Alignment(horizontal: .leading, vertical: .center)

    public static let trailingTop = Alignment(horizontal: .trailing, vertical: .top)
    public static let trailingBottom = Alignment(horizontal: .trailing, vertical: .bottom)
    public static let trailingCenter = Alignment(horizontal: .trailing, vertical: .center)

    public static let centerTop = Alignment(horizontal: .center, vertical: .top)
    public static let centerBottom = Alignment(horizontal: .center, vertical: .bottom)
    public static let center = Alignment(horizontal: .center, vertical: .center)
}

extension HorizontalAlignment {
    func verticalAlignment() -> VerticalAlignment {
        switch self {
        case .leading:
            return .top
        case .trailing:
            return .bottom
        case .center:
            return .center
        }
    }
}

extension VerticalAlignment {
    func horizontalAlignment() -> HorizontalAlignment {
        switch self {
        case .top:
            return .leading
        case .bottom:
            return .trailing
        case .center:
            return .center
        }
    }
}
