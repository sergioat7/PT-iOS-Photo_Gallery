//
//  PhotoListViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

protocol PhotoListViewModelProtocol: class {
    /**
     * Add here your methods for communication VIEW -> VIEW_MODEL
     */
    func viewDidLoad()
    func getPhotoCellViewModels() -> [PhotoCellViewModel]
}

class PhotoListViewModel: BaseViewModel {
    
    // MARK: - Public variables
    
    weak var view:PhotoListViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: PhotoListDataManagerProtocol
    
    private var photoCellViewModels: [PhotoCellViewModel] = []
    
    // MARK: - Initialization
    
    init(view:PhotoListViewProtocol,
         dataManager: PhotoListDataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
}

extension PhotoListViewModel: PhotoListViewModelProtocol {
    
    func viewDidLoad() {
        
        view?.showLoading()
        dataManager.getPhotoList(success: { photoListResponse in
            
            self.photoCellViewModels = photoListResponse.compactMap({PhotoCellViewModel(photo: $0)})
            self.view?.showPhotos()
            self.view?.hideLoading()
        }, failure: { error in
            print(error)
        })
    }
    
    func getPhotoCellViewModels() -> [PhotoCellViewModel] {
        return photoCellViewModels
    }
}

