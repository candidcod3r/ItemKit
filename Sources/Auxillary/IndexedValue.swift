//
//  IndexedValue.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/17/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct IndexedValue<ValueType> {
    let index: Int
    let value: ValueType
    init(index: Int, value: ValueType) {
        self.index = index
        self.value = value
    }
}

extension Array {

    func indexedValues() -> [IndexedValue<Element>] {
        return enumerated().map { IndexedValue(index: $0.offset, value: $0.element) }
    }

}
