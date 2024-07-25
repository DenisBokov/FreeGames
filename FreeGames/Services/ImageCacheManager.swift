//
//  ImageCacheManager.swift
//  FreeGames
//
//  Created by Denis Bokov on 25.07.2024.
//

import UIKit

class ImageCacheManager {
    static var shared = NSCache<NSString, UIImage>()
    
    private init() {}
}

