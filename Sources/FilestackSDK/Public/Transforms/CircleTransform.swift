//
//  CircleTransform.swift
//  FilestackSDK
//
//  Created by Ruben Nine on 21/08/2017.
//  Copyright © 2017 Filestack. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#else
import Cocoa
#endif

/// Applies a circle border effect to the image.
public class CircleTransform: Transform {
    // MARK: - Lifecycle

    /// Initializes a `CircleTransform` object.
    public init() {
        super.init(name: "circle")
    }
}

// MARK: - Public Functions

public extension CircleTransform {
    /// Adds the `background` option.
    ///
    /// - Parameter value: Sets the background color to display behind the image.
    @discardableResult
    func background(_ value: PlatformColor) -> Self {
        return appending(key: "background", value: value.hexString)
    }
}
