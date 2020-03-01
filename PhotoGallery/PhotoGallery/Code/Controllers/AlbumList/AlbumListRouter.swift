//
//  AlbumListRouter.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class AlbumListRouter: BaseRouter {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private var view:AlbumListViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "AlbumListView", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "AlbumList") as? AlbumListViewController {
            let viewModel: AlbumListViewModelProtocol = AlbumListViewModel(view: controller,
                                                                                                                   dataManager: dataManager)
            controller.set(viewModel: viewModel)
            return controller
        }
        return AlbumListViewController()
    }
    
    private var dataManager: AlbumListDataManagerProtocol {
        return AlbumListDataManager(apiClient: apiClient)
    }
    
    private var apiClient: AlbumListApiClientProtocol {
        return AlbumListApiClient()
    }
    
    // MARK: - Initialization
    
    override init() {}
    
    // MARK: - Presentation Methods
    
    func push() {
        push(viewController: view)
    }
    
}

