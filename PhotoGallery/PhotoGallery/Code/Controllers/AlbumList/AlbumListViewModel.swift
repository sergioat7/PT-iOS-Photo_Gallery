//
//  AlbumListViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

protocol AlbumListViewModelProtocol: class {
    /**
     * Add here your methods for communication VIEW -> VIEW_MODEL
     */
    func viewDidLoad()
    func getAlbumCellViewModels() -> [AlbumCellViewModel]
}

class AlbumListViewModel: BaseViewModel {
    
    // MARK: - Public variables
    
    weak var view:AlbumListViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: AlbumListDataManagerProtocol
    
    private var albumCellViewModels: [AlbumCellViewModel] = []
    
    // MARK: - Initialization
    
    init(view:AlbumListViewProtocol,
         dataManager: AlbumListDataManagerProtocol) {
        self.view = view
        self.dataManager = dataManager
    }
}

extension AlbumListViewModel: AlbumListViewModelProtocol {
    
    func viewDidLoad() {
        
        view?.showLoading()
        dataManager.getAlbumList(success: { albumListResponse in
            
            self.albumCellViewModels = albumListResponse.compactMap({AlbumCellViewModel(album: $0)})
            self.view?.showAlbums()
            self.view?.hideLoading()
        }, failure: { error in
            print(error)
        })
    }
    
    func getAlbumCellViewModels() -> [AlbumCellViewModel] {
        return albumCellViewModels
    }
}

