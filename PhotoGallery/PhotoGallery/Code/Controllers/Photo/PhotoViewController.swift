//
//  PhotoViewController.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

protocol PhotoViewProtocol: BaseViewProtocol {
    /**
     * Add here your methods for communication VIEW_MODEL -> VIEW
     */
    func showPhoto(photo: PhotoResponse)
}

protocol PhotoConfigurableViewProtocol: class {

    func set(viewModel: PhotoViewModelProtocol)
    
}

class PhotoViewController: BaseViewController {
    
    // MARK: - Public properties
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbPhoto: UILabel!
    
    // MARK: - Private properties
    
    private var viewModel:PhotoViewModelProtocol?
    
    private var photo: PhotoResponse?
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo"
        viewModel?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Actions
    
    // MARK: - Overrides
    
    // MARK: - Private functions
    
    private func setup() {
        
        if let imageStringUrl = photo?.url, let imageUrl = URL(string: imageStringUrl) {
            ivPhoto.kf.indicatorType = .activity
            ivPhoto.kf.setImage(with: imageUrl)
        }
        lbPhoto.text = photo?.title ?? ""
    }
    
}

// MARK: - PhotoViewProtocol

extension PhotoViewController:  PhotoViewProtocol {
    
    func showPhoto(photo: PhotoResponse) {
        
        self.photo = photo
        setup()
    }
}

// MARK: - PhotoViewProtocol

extension PhotoViewController:  PhotoConfigurableViewProtocol {
    
    func set(viewModel: PhotoViewModelProtocol) {
        self.viewModel = viewModel
    }
    
}
