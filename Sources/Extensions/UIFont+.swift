//
//  UIFont+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/14/19.
//  Copyright (c) 2019 Candid Cod3r.
//

enum FontName: String {
    case helvetica = "Helvetica"
    case helveticaMedium = "HelveticaNeue-Medium"
    case helveticaLight = "HelveticaNeue-Light"
    case helveticaLightItalic = "HelveticaNeue-LightItalic"
    case appleSDGothicNeoLight = "AppleSDGothicNeo-Light"
}

extension UIFont {
    static let defaultLabel = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    static let defaultTextView = UIFont.systemFont(ofSize: UIFont.systemFontSize)
    static let buttonTitle = UIFont.systemFont(ofSize: UIFont.systemFontSize)

    static func helvetica(of size: CGFloat) -> UIFont {
        return self.font(with: FontName.helvetica, size: size)
    }

    static func helveticaLight(of size: CGFloat) -> UIFont {
        return self.font(with: FontName.helveticaLight, size: size)
    }

    static func helveticaMedium(of size: CGFloat) -> UIFont {
        return self.font(with: FontName.helveticaMedium, size: size)
    }

    static func font(with name: FontName, size: CGFloat) -> UIFont {
        if let font = UIFont(name: name.rawValue, size: size) {
            return font
        } else {
            assert(false, "\(name.rawValue) font not found")
            return UIFont.systemFont(ofSize: size)
        }
    }
}
