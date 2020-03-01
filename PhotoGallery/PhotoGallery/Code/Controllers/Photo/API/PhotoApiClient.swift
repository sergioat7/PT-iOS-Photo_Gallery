//
//  PhotoApiClient.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoApiClientProtocol {
    
    func getPhoto(photoId: Int64, success: @escaping (PhotoResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class PhotoApiClient: PhotoApiClientProtocol {
    
    func getPhoto(photoId: Int64, success: @escaping (PhotoResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let request = GetPhotoRequest(photoId: photoId)
        APIClient.shared.sendServer(request, success: { photoResponse in
            success(photoResponse)
        }, failure: { error in
            failure(error)
        })
    }
}
