//
//  TransformPosition.swift
//  FilestackSDK
//
//  Created by Ruben Nine on 7/12/17.
//  Copyright © 2017 Filestack. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#else
import Cocoa
#endif

/// Represents an image transform position type.
public struct TransformPosition: OptionSet {
    /// Top
    public static let top = TransformPosition(rawValue: 1 << 0)

    /// Middle
    public static let middle = TransformPosition(rawValue: 1 << 1)

    /// Bottom
    public static let bottom = TransformPosition(rawValue: 1 << 2)

    /// Left
    public static let left = TransformPosition(rawValue: 1 << 3)

    /// Center
    public static let center = TransformPosition(rawValue: 1 << 4)

    /// Right
    public static let right = TransformPosition(rawValue: 1 << 5)

    public let rawValue: Int

    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

// MARK: - Public Functions

extension TransformPosition {
    static func all() -> [TransformPosition] {
        return [.top, .middle, .bottom, .left, .center, .right]
    }

    func toArray() -> [String] {
        let ops: [String] = type(of: self).all().compactMap {
            guard contains($0) else {
                return nil
            }
            return $0.stringValue()
        }

        return ops
    }
}

// MARK: - Private Functions

private extension TransformPosition {
    func stringValue() -> String? {
        switch self {
        case .top: return "top"
        case .middle: return "middle"
        case .bottom: return "bottom"
        case .left: return "left"
        case .center: return "center"
        case .right: return "right"
        default: return nil
        }
    }
}
