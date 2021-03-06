//
//  ViewExtension.swift
//  Recipe Book
//
//  Created by Jonas Frey on 16.10.19.
//  Copyright © 2019 Jonas Frey. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    
    /// Applies a modifier, if a given condition is met
    /// - Parameter modifier: The Modifier to apply, if the condition is met
    public func conditionalModifier<T>(_ condition: Bool, _ modifier: T) -> some View where T: ViewModifier {
        Group {
            if condition {
                self.modifier(modifier)
            } else {
                self
            }
        }
    }
    
    /// Applies one of two modifiers conditionally
    /// - Parameter condition: The condition to evaluate
    /// - Parameter trueModifier: The modifier to apply, if the condition is met
    /// - Parameter falseModifier: The modifier to apply, if the condition is not met
    public func conditionalModifier<M1, M2>(_ condition: Bool, _ trueModifier: M1, _ falseModifier: M2) -> some View where M1: ViewModifier, M2: ViewModifier {
        Group {
            if condition {
                self.modifier(trueModifier)
            } else {
                self.modifier(falseModifier)
            }
        }
    }
    
    /// Hides a view conditionally
    /// - Parameter condition: Whether the view should be hidden or not.
    public func hidden(_ condition: Bool) -> some View {
        return condition ? AnyView(self.hidden()) : AnyView(self)
    }
    
}

extension Image {
    /// Creates an Image View using the given image, or the default image, if the first didn't exist.
    /// - Parameter name: The image to use for the view
    /// - Parameter defaultImage: The fallback image name, to use when the image `name` didn't exist
    init(_ name: String, defaultImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(defaultImage)
        }
    }
    
    /// Creates an Image View using the given image, or a default icon, if the first didn't exist.
    /// - Parameter name: The image to use for the view
    /// - Parameter defaultImage: The fallback icon name, to use when the image `name` didn't exist
    init(_ name: String, defaultSystemImage: String) {
        if let img = UIImage(named: name) {
            self.init(uiImage: img)
        } else {
            self.init(systemName: defaultSystemImage)
        }
    }
    
    /// Creates an Image View using the given image, or a default image, if the first didn't exist.
    /// - Parameter name: The image to use for the view
    /// - Parameter defaultImage: The fallback image name, to use when the image `name` didn't exist
    init(uiImage: UIImage?, defaultImage: String) {
        if let image = uiImage {
            self.init(uiImage: image)
        } else {
            self.init(defaultImage)
        }
    }
    
    /// Creates an Image View using the given image, or a default icon, if the first didn't exist.
    /// - Parameter name: The image to use for the view
    /// - Parameter defaultImage: The fallback icon name, to use when the image `name` didn't exist
    init(uiImage: UIImage?, defaultSystemImage: String) {
        if let image = uiImage {
            self.init(uiImage: image)
        } else {
            self.init(systemName: defaultSystemImage)
        }
    }
}

extension Strideable {
    /// Returns `self` clamped to the bounds of the given range.
    /// - Parameter range: The bounds to clamp `self` to
    /// - Returns:
    ///     * `nil`, if the range is empty,
    ///     * `self`, if the range contains `self`,
    ///     * `self` clamped to the bounds of the range otherwise
    func clamped(to range: ClosedRange<Self>) -> Self? {
        guard !range.isEmpty else {
            return nil
        }
        if self < range.lowerBound {
            return range.lowerBound
        } else if self >= range.upperBound {
            return range.upperBound.advanced(by: -1)
        }
        return self
    }
}
