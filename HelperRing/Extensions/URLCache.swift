//
//  URLCacheExtensions.swift
//  HelperRing
//
//  Created by Mauricio Dias on 21/10/2022.
//


import Foundation

extension URLCache {
    
    /// Set memory capacity to save the photos in the cache memory o
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
    
}
