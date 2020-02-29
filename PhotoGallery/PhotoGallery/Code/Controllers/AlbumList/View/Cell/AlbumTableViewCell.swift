//
//  AlbumTableViewCell.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import UIKit
import Kingfisher

class AlbumTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbAlbumName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(album: AlbumResponse?) {
        lbAlbumName.text = album?.title ?? ""
    }
    
}
