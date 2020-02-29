//
//  AlbumResponse.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation

typealias AlbumsResponse = [AlbumResponse]

struct AlbumResponse: Codable {
    let userId: Int64
    let id: Int64
    let title: String
}
