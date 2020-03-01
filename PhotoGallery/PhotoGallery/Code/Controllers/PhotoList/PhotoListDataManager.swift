//
//  PhotoListDataManager.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoListDataManagerProtocol: class {
    /**
     * Add here your methods for communication VIEW_MODEL -> DATA_MANAGER
     */
    func getPhotoList(success: @escaping (PhotosResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class PhotoListDataManager: BaseDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private let apiClient: PhotoListApiClientProtocol
    private let albumId: Int64
    
    // MARK: - Initialization
    
    init(apiClient: PhotoListApiClientProtocol,
         albumId: Int64) {
        self.apiClient = apiClient
        self.albumId = albumId
    }
}

extension PhotoListDataManager: PhotoListDataManagerProtocol {
    
    func getPhotoList(success: @escaping (PhotosResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        apiClient.getPhotoList(albumId: albumId, success: success, failure: failure)
    }
}

