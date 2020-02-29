//
//  PhotoTableViewCell.swift
//  PhotoGallery
//
//  Created by alumno on 01/03/2020.
//

import UIKit
import Kingfisher

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var lbPhoto: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(photo: PhotoResponse?) {
        
        if let imageStringUrl = photo?.thumbnailUrl, let imageUrl = URL(string: imageStringUrl) {
            ivPhoto.kf.indicatorType = .activity
            ivPhoto.kf.setImage(with: imageUrl)
        }
        lbPhoto.text = photo?.title ?? ""
    }
}
