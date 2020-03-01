//
//  PhotoRouter.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class PhotoRouter: BaseRouter {
    
    // MARK: - Public variables
    
    // MARK: - Private variables
    
    private var view:PhotoViewController {
        let storyboard: UIStoryboard = UIStoryboard(name: "PhotoView", bundle: nil)
        if let controller = storyboard.instantiateViewController(withIdentifier: "Photo") as? PhotoViewController {
            let viewModel: PhotoViewModelProtocol = PhotoViewModel(view: controller,
                                                                   dataManager: dataManager)
            controller.set(viewModel: viewModel)
            return controller
        }
        return PhotoViewController()
    }
    
    private var dataManager: PhotoDataManagerProtocol {
        return PhotoDataManager(apiClient: apiClient,
                                photoId: photoId)
    }
    
    private var apiClient: PhotoApiClientProtocol {
        return PhotoApiClient()
    }
    
    // MARK: - Initialization
    
    private let photoId: Int64
    
    init(photoId: Int64) {
        self.photoId = photoId
    }
    
    // MARK: - Presentation Methods
    
    func push() {
        push(viewController: view)
    }
    
}

