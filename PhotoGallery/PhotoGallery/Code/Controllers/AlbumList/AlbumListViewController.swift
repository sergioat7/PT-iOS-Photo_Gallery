//
//  AlbumListViewController.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol AlbumListViewProtocol: BaseViewProtocol {
    /**
     * Add here your methods for communication VIEW_MODEL -> VIEW
     */
    
}

protocol AlbumListConfigurableViewProtocol: class {

    func set(viewModel: AlbumListViewModelProtocol)
    
}

class AlbumListViewController: BaseViewController {
    
    // MARK: - Public properties
    
    // MARK: - Private properties
    
    private var viewModel:AlbumListViewModelProtocol?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    
}

// MARK: - AlbumListViewProtocol

extension AlbumListViewController:  AlbumListViewProtocol {
    
}

// MARK: - AlbumListViewProtocol

extension AlbumListViewController:  AlbumListConfigurableViewProtocol {
    
    func set(viewModel: AlbumListViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}
