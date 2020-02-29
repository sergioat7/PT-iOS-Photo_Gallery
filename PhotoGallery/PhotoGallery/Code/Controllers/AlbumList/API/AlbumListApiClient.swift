//
//  AlbumListApiClient.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol AlbumListApiClientProtocol {
    
    func getAlbumList(success: @escaping (AlbumsResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class AlbumListApiClient: AlbumListApiClientProtocol {
    
    func getAlbumList(success: @escaping (AlbumsResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        
        let request = GetAlbumListRequest()
        APIClient.shared.sendServer(request, success: { albumListResponse in
            success(albumListResponse)
        }, failure: { error in
            failure(error)
        })
    }
}
