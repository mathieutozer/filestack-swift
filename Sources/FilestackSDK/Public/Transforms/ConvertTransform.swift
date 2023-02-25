//
//  ConvertTransform.swift
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

/// Converts the image to a different format.
///
/// Matrix of supported conversions can be found here: https://cdn.filestackcontent.com/UPqbkTIETnGaQJa1nqnG?dl=true
public class ConvertTransform: Transform {
    // MARK: - Lifecycle

    /// Initializes a `ConvertTransform` object.
    public init() {
        super.init(name: "output")
    }
}

// MARK: - Lifecycle

public extension ConvertTransform {
    /// Adds the `format` option.
    ///
    /// - Parameter value: The format to which you would like to convert the file.
    @discardableResult
    func format(_ value: TransformFiletype) -> Self {
        return appending(key: "format", value: value)
    }

    /// Adds the `background` option.
    ///
    /// - Parameter value: Set a background color when converting transparent .png files
    /// into other file types.
    @discardableResult
    func background(_ value: PlatformColor) -> Self {
        return appending(key: "background", value: value.hexString)
    }

    /// Adds the `page` option.
    ///
    /// - Parameter value: If you are converting a file that contains multiple pages such as a PDF
    /// or PowerPoint file, you can extract a specific page using the page parameter.
    /// Valid range: `1...99999`
    @discardableResult
    func page(_ value: Int) -> Self {
        return appending(key: "page", value: value)
    }

    /// Adds the `density` option.
    ///
    /// - Parameter value: You can adjust the density when converting documents like PowerPoint,
    /// PDF, AI and EPS files to image formats like JPG or PNG. Valid range: `1...500`
    @discardableResult
    func density(_ value: Int) -> Self {
        return appending(key: "density", value: value)
    }

    /// Adds the `compress` option.
    /// Takes advantage of Filestack's image compression which utilizes JPEGtran and OptiPNG.
    @discardableResult
    func compress() -> Self {
        return appending(key: "compress", value: true)
    }

    /// Adds the `quality` option.
    ///
    /// - Parameter value: You can change the quality (and reduce the file size) of JPEG images
    /// by using the quality parameter. Valid range: `1...100`
    @discardableResult
    func quality(_ value: Int) -> Self {
        return appending(key: "quality", value: value)
    }

    /// Adds the `quality` option with value set to "input".
    /// Used for JPG images if we want output file to have same quality as original one.
    @discardableResult
    func preserveInputQuality() -> Self {
        return appending(key: "quality", value: "input")
    }

    /// Adds the `strip` option.
    /// Remove embedded file metadata.
    @discardableResult
    func strip() -> Self {
        return appending(key: "strip", value: true)
    }

    /// Adds the `colorspace` option.
    ///
    /// - Parameter value: An `TransformColorSpace` value.
    @discardableResult
    func colorSpace(_ value: TransformColorSpace) -> Self {
        return appending(key: "colorspace", value: value)
    }

    /// Adds the `secure` option.
    /// Applies to conversions of HTML and SVG sources only.
    /// When the secure parameter is set to true, the HTML or SVG file will be stripped of any insecure tags.
    @discardableResult
    func secure() -> Self {
        return appending(key: "secure", value: true)
    }

    /// Adds the `docinfo` option.
    /// Gives information about a document, such as the number of pages and the dimensions of the file.
    /// This information is delivered as a JSON object.
    @discardableResult
    func docInfo() -> Self {
        return appending(key: "docinfo", value: true)
    }

    /// Adds the `pageFormat` option.
    ///
    /// - Parameter value: An `TransformPageFormat` value.
    @discardableResult
    func pageFormat(_ value: TransformPageFormat) -> Self {
        return appending(key: "pageformat", value: value)
    }

    /// Adds the `pageOrientation` option.
    ///
    /// - Parameter value: An `TransformPageOrientation` value.
    @discardableResult
    func pageOrientation(_ value: TransformPageOrientation) -> Self {
        return appending(key: "pageorientation", value: value)
    }
}
