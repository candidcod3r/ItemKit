//
//  NSAttributedString+.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

extension NSAttributedString {

    func apply(font: UIFont) -> NSAttributedString {
        let result = NSMutableAttributedString(string: string, attributes: [NSAttributedString.Key.font : font])
        let range = NSRange(location: 0, length: self.string.count)

        result.beginEditing()
        self.enumerateAttributes(
            in: range,
            options: .longestEffectiveRangeNotRequired) { (attributes, range, _) in
                result.addAttributes(attributes, range: range)
        }
        result.endEditing()

        return result
    }

}
