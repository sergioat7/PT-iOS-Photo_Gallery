//
//  PhotoResponse.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation

typealias PhotosResponse = [PhotoResponse]

struct PhotoResponse: Codable {
    let albumId: Int64
    let id: Int64
    let title: String
    let url: String
    let thumbnailUrl: String
}
