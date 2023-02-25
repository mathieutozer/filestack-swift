//
//  URL+Uploadable.swift
//  FilestackSDK
//
//  Created by Ruben Nine on 10/09/2019.
//  Copyright © 2019 Filestack. All rights reserved.
//

import Foundation
#if os(iOS)
import MobileCoreServices
#endif

extension URL: Uploadable {
    public var filename: String? { lastPathComponent }

    public var size: UInt64? {
        guard isFileURL,
              let attributtes = try? FileManager.default.attributesOfItem(atPath: relativePath)
        else {
            return nil
        }

        return attributtes[.size] as? UInt64
    }

    public var mimeType: String? {
        guard let uti = uniformTypeIdentifier,
              let mimeTypeRef = UTTypeCopyPreferredTagWithClass(uti, kUTTagClassMIMEType)
        else {
            return nil
        }

        let mimeType = mimeTypeRef.takeUnretainedValue()
        mimeTypeRef.release()

        return mimeType as String
    }
}

// MARK: - Private Functions

private extension URL {
    var uniformTypeIdentifier: CFString? {
        let ext = pathExtension as CFString
        let tag = kUTTagClassFilenameExtension

        guard let utiRef = UTTypeCreatePreferredIdentifierForTag(tag, ext, nil) else { return nil }

        let uti = utiRef.takeUnretainedValue()
        utiRef.release()

        return uti
    }
}
