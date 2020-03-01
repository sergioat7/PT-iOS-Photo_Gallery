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
     func showPhotos()
}

protocol PhotoListConfigurableViewProtocol: class {

    func set(viewModel: PhotoListViewModelProtocol)
    
}

class PhotoListViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private properties
    
    private var viewModel:PhotoListViewModelProtocol?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "PHOTOS".localized()
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
    
    func showPhotos() {
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
        
        let photoCellViewModels = viewModel?.getPhotoCellViewModels()
        let photoId = photoCellViewModels?[indexPath.row].id ?? 0
        PhotoRouter(photoId: photoId).push()
    }
}

// MARK: - UITableViewDataSource

extension PhotoListViewController:  UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let photoCellViewModels = viewModel?.getPhotoCellViewModels()
        return photoCellViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoTableViewCell
        
        let photoCellViewModels = viewModel?.getPhotoCellViewModels()
        let photoCellViewModel = photoCellViewModels?[indexPath.row]
        cell.photoCellViewModel = photoCellViewModel
        
        return cell
    }
}
