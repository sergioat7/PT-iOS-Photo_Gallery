//
//  PhotoDataManager.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoDataManagerProtocol: class {
    /**
     * Add here your methods for communication VIEW_MODEL -> DATA_MANAGER
     */
    func getPhoto(success: @escaping (PhotoResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class PhotoDataManager: BaseDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private let apiClient: PhotoApiClientProtocol
    private let photoId: Int64
    
    // MARK: - Initialization
    
    init(apiClient: PhotoApiClientProtocol,
         photoId: Int64) {
        self.apiClient = apiClient
        self.photoId = photoId
    }
}

extension PhotoDataManager: PhotoDataManagerProtocol {
    
    func getPhoto(success: @escaping (PhotoResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        apiClient.getPhoto(photoId: photoId, success: success, failure: failure)
    }
}

