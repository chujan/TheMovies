//
//  EnvironmentValues+ImageCache.swift
//  TheMovies
//
//  Created by Chukwuemeka Jennifer on 08/12/2021.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TempImageCache()
}
extension EnvironmentValues {
    var imageCache: ImageCache{
        get {self[ImageCacheKey.self]}
        set{self[ImageCacheKey.self] = newValue}
    }
}
