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
    func showAlbums(albums: AlbumsResponse)
}

protocol AlbumListConfigurableViewProtocol: class {

    func set(viewModel: AlbumListViewModelProtocol)
    
}

class AlbumListViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var viewModel:AlbumListViewModelProtocol?
    
    private var albums: AlbumsResponse?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Albums"
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
    
    func showAlbums(albums: AlbumsResponse) {
        self.albums = albums
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
        print("cell tapped")
    }
}

// MARK: - UITableViewDataSource

extension AlbumListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        albums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumTableViewCell
        cell.configure(album: albums?[indexPath.row])
        return cell
    }
}
