//
//  RotateTransform.swift
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

/// Rotates an image in a range from 0 to 359 degrees or based on Exif information.
public class RotateTransform: Transform {
    // MARK: - Lifecycle

    /// Initializes a `RotateTransform` object with rotation based on Exif information.
    public init() {
        super.init(name: "rotate")

        appending(key: "deg", value: "exif")
    }

    /// Initializes a `RotateTransform` object using a given rotation degree.
    ///
    /// - Parameter deg: The rotation angle in degrees. Valid range: `0...359`
    public init(deg: Int) {
        super.init(name: "rotate")

        appending(key: "deg", value: deg)
    }
}

// MARK: - Public Functions

public extension RotateTransform {
    /// Adds the `exif` option.
    ///
    /// - Parameter value: If `true`, sets the Exif orientation of the image to Exif orientation 1.
    /// A `false` value takes an image and sets the exif orientation to the first of the eight
    /// EXIF orientations. The image will behave as though it is contained in an html img tag
    /// if displayed in an application that supports Exif orientations.
    @discardableResult
    func exif(_ value: Bool) -> Self {
        return appending(key: "exif", value: value)
    }

    /// Adds the `background` option.
    ///
    /// - Parameter value: The background color to display if the image is rotated less than a full 90 degrees.
    @discardableResult
    func background(_ value: PlatformColor) -> Self {
        return appending(key: "background", value: value.hexString)
    }
}
