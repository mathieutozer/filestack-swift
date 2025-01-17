//
//  PartialBlurTransform.swift
//  FilestackSDK
//
//  Created by Mihály Papp on 14/06/2018.
//  Copyright © 2018 Filestack. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#else
import Cocoa
#endif

/// Changes image brightness, saturation and hue.
public class PartialBlurTransform: Transform {
    // MARK: - Lifecycle

    /// Initializes a `PartialBlurTransform` object.
    public init(objects: [CGRect]) {
        super.init(name: "partial_blur")

        let values = objects.map {
            "[\(Int($0.origin.x)),\(Int($0.origin.y)),\(Int($0.size.width)),\(Int($0.size.height))]"
        }

        appending(key: "objects", value: values)
    }
}

// MARK: - Public Functions

public extension PartialBlurTransform {
    /// Adds `amount` option.
    ///
    /// - Parameter value: Valid range: `2...100`
    @discardableResult
    func amount(_ value: Int) -> Self {
        return appending(key: "amount", value: value)
    }

    /// Adds the `blur` option.
    ///
    /// - Parameter value: The amount to blur the pixelated faces. Valid range: `0...20`
    @discardableResult
    func blur(_ value: Float) -> Self {
        return appending(key: "blur", value: value)
    }

    /// Adds the `type` option.
    ///
    /// - Parameter value: An `TransformShapeType` value.
    @discardableResult
    func type(_ value: TransformShapeType) -> Self {
        return appending(key: "type", value: value)
    }
}
