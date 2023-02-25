//
//  ASCIITransform.swift
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

/// Converts the image to black and white.
public class ASCIITransform: Transform {
    // MARK: - Lifecycle

    /// Initializes an `ASCIITransform` object.
    public init() {
        super.init(name: "ascii")
    }
}

// MARK: - Public Functions

public extension ASCIITransform {
    /// Adds the `background` option.
    ///
    /// - Parameter value: Sets the background color to display behind the image.
    @discardableResult
    func background(_ value: PlatformColor) -> Self {
        return appending(key: "background", value: value.hexString)
    }

    /// Adds the `foreground` option.
    ///
    /// - Parameter value: Sets the foreground color to display behind the image.
    @discardableResult
    func foreground(_ value: PlatformColor) -> Self {
        return appending(key: "foreground", value: value.hexString)
    }

    /// Adds the `colored` option.
    ///
    /// Sets output as colored.
    @discardableResult
    func colored() -> Self {
        return appending(key: "colored", value: true)
    }

    /// Adds the `size` option.
    ///
    /// - Parameter value: The size of the overlayed image as a percentage of its original size.
    /// Valid range: `10...100`
    @discardableResult
    func size(_ value: Int) -> Self {
        return appending(key: "size", value: value)
    }

    /// Reverses the character set used to generate the ASCII output. Works well with dark backgrounds.
    @discardableResult
    func reverse() -> Self {
        return colored().appending(key: "reverse", value: true)
    }
}

// MARK: - Deprecated

@available(*, deprecated, renamed: "ASCIITransform")
typealias AsciiTransform = ASCIITransform
