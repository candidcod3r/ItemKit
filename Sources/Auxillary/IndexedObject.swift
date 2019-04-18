//
//  IndexedObject.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/17/19.
//  Copyright (c) 2019 Candid Cod3r.
//

struct IndexedObject<ObjectType> {
    let index: Int
    let object: ObjectType
    init(index: Int, object: ObjectType) {
        self.index = index
        self.object = object
    }
}
