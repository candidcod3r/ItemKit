//
//  Measurable.swift
//  ItemKit
//
//  Created by Candid Cod3r on 4/13/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public protocol Measurable {
    /**
     Fitting size of the measurable that is computed based on a maxSize given. Fitting size is computed based on the
     contentFittingSize.
     */
    var fittingSize: CGSize { get }

    /**
     Content fitting size of this measurable, this is the size of the inner content of the item.
     */
    var contentFittingSize: CGSize { get }

    /**
     Used to update the fitting size of the measurable, this might internally update the contentFitting size
     since fittingSize is computed based on the contentFittingSize. Subclasses most likely doesn't have to implement
     this method, instead may want to override contentFittingSize.

     - Parameter maxSize: FittingSize computed with in the maxSize
     */
    mutating func updateFittingSize(within maxSize: CGSize)

    /**
     Returns ths content fitting size.

     - Returns: Content fitting size of the measurable
     */
    mutating func contentFittingSize(within maxSize: CGSize) -> CGSize
}
