//
//  AlbumTableViewCell.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbAlbumName: UILabel!
    
    var albumCellViewModel: AlbumCellViewModel? {
        didSet {
            configure()
        }
    }
    
    func configure() {
        lbAlbumName.text = albumCellViewModel?.title ?? ""
    }
    
}
