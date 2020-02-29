//
//  AlbumListViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol AlbumListViewModelProtocol: class {
    /**
     * Add here your methods for communication VIEW -> VIEW_MODEL
     */
    func viewDidLoad()
}

class AlbumListViewModel: BaseViewModel {
    
    // MARK: - Public variables
    
    weak var view:AlbumListViewProtocol?
    
    // MARK: - Private variables
    
    private var dataManager: AlbumListDataManagerProtocol
    
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
            
            self.view?.showAlbums(albums: albumListResponse)
            self.view?.hideLoading()
        }, failure: { error in
            print(error)
        })
    }
}

