//
//  PhotoViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

protocol PhotoViewModelProtocol: class {
    /**
     * Add here your methods for communication VIEW -> VIEW_MODEL
     */
    func viewDidLoad()
}

class PhotoViewModel: BaseViewModel {
    
    // MARK: - Public variables
    
    weak var view:PhotoViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: PhotoDataManagerProtocol
    
    // MARK: - Initialization
    
    init(view:PhotoViewProtocol,
         dataManager: PhotoDataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
}

extension PhotoViewModel: PhotoViewModelProtocol {
    
    func viewDidLoad() {
        
        view?.showLoading()
        dataManager.getPhoto(success: { photoResponse in
            
            self.view?.showPhoto(photo: photoResponse)
            self.view?.hideLoading()
        }, failure: { error in
            print(error)
        })
    }
}

