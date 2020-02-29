//
//  PhotoListRouter.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class PhotoListRouter: BaseRouter {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private var view:PhotoListViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "PhotoListView", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "PhotoList") as? PhotoListViewController {
            let viewModel: PhotoListViewModelProtocol = PhotoListViewModel(view: controller,
                                                                           dataManager: dataManager)
            controller.set(viewModel: viewModel)
            return controller
        }
        return PhotoListViewController()
    }
    
    private var dataManager: PhotoListDataManagerProtocol {
        return PhotoListDataManager(apiClient: apiClient,
                                    albumId: albumId)
    }
    
    private var apiClient: PhotoListApiClientProtocol {
        return PhotoListApiClient()
    }
    
    // MARK: - Initialization
    
    private var albumId: Int64
    
    init(albumId: Int64) {
        self.albumId = albumId
    }
    
    // MARK: - Presentation Methods
    
    func push() {
        push(viewController: view)
    }
    
}

