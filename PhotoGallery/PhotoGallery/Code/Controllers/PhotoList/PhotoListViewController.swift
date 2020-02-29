//
//  PhotoListViewController.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoListViewProtocol: BaseViewProtocol {
    /**
     * Add here your methods for communication VIEW_MODEL -> VIEW
     */
     func showPhotos(photos: PhotosResponse)
}

protocol PhotoListConfigurableViewProtocol: class {

    func set(viewModel: PhotoListViewModelProtocol)
    
}

class PhotoListViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var viewModel:PhotoListViewModelProtocol?
    
    private var photos: PhotosResponse?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photos"
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
        tableView.register(UINib(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "PhotoCell")
    }
    
}

// MARK: - PhotoListViewProtocol

extension PhotoListViewController:  PhotoListViewProtocol {
    
    func showPhotos(photos: PhotosResponse) {
        self.photos = photos
        tableView.reloadData()
    }
}

// MARK: - PhotoListViewProtocol

extension PhotoListViewController:  PhotoListConfigurableViewProtocol {
    
    func set(viewModel: PhotoListViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}

// MARK: - UITableViewDelegate

extension PhotoListViewController:  UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cell tapped")
    }
}

// MARK: - UITableViewDataSource

extension PhotoListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        photos?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoTableViewCell
        cell.configure(photo: photos?[indexPath.row])
        return cell
    }
}
