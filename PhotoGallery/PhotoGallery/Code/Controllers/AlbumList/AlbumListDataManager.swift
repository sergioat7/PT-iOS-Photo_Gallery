//
//  AlbumListDataManager.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol AlbumListDataManagerProtocol: class {
    /**
     * Add here your methods for communication VIEW_MODEL -> DATA_MANAGER
     */
    func getAlbumList(success: @escaping (AlbumsResponse) -> Void, failure: @escaping (ErrorResponse) -> Void)
}

class AlbumListDataManager: BaseDataManager {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private let apiClient: AlbumListApiClientProtocol
    
    // MARK: - Initialization
    
    init(apiClient: AlbumListApiClientProtocol) {
        self.apiClient = apiClient
    }
}

extension AlbumListDataManager: AlbumListDataManagerProtocol {
    
    func getAlbumList(success: @escaping (AlbumsResponse) -> Void, failure: @escaping (ErrorResponse) -> Void) {
        apiClient.getAlbumList(success: success, failure: failure)
    }
}

