//
//  PhotoListApiClient.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoListApiClientProtocol {
    
    func getPhotoList(albumId: Int64, success: @escaping (PhotosResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class PhotoListApiClient: PhotoListApiClientProtocol {
    
    func getPhotoList(albumId: Int64, success: @escaping (PhotosResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let request = GetPhotoListRequest(albumId: albumId)
        APIClient.shared.sendServer(request, success: { photoListResponse in
            success(photoListResponse)
        }, failure: { error in
            failure(error)
        })
    }
}
