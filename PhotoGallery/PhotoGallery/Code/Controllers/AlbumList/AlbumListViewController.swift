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
    func showAlbums()
}

protocol AlbumListConfigurableViewProtocol: class {

    func set(viewModel: AlbumListViewModelProtocol)
    
}

class AlbumListViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var viewModel:AlbumListViewModelProtocol?
        
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "ALBUMS".localized()
        setupTableView()
        viewModel?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    
    private func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        registerNib()
    }
    
    private func registerNib() {
        tableView.register(UINib(nibName: "AlbumTableViewCell", bundle: nil), forCellReuseIdentifier: "AlbumCell")
    }
    
}

// MARK: - AlbumListViewProtocol

extension AlbumListViewController:  AlbumListViewProtocol {
    
    func showAlbums() {
        tableView.reloadData()
    }
}

// MARK: - AlbumListViewProtocol

extension AlbumListViewController:  AlbumListConfigurableViewProtocol {
    
    func set(viewModel: AlbumListViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}

// MARK: - UITableViewDelegate

extension AlbumListViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let albumCellViewModels = viewModel?.getAlbumCellViewModels()
        let albumId = albumCellViewModels?[indexPath.row].id ?? 0
        PhotoListRouter(albumId: albumId).push()
    }
}

// MARK: - UITableViewDataSource

extension AlbumListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let albumCellViewModels = viewModel?.getAlbumCellViewModels()
        return albumCellViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumTableViewCell
        
        let albumCellViewModels = viewModel?.getAlbumCellViewModels()
        let albumCellViewModel = albumCellViewModels?[indexPath.row]
        cell.albumCellViewModel = albumCellViewModel
        
        return cell
    }
}
