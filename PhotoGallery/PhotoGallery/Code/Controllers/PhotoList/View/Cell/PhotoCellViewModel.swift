//
//  PhotoCellViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

class PhotoCellViewModel: BaseViewModel {

    private let photo: PhotoResponse
    
    init(photo: PhotoResponse) {
        self.photo = photo
    }
    
    var id: Int64 {
        get {
            return photo.id
        }
    }
    
    var title: String {
        get {
            return photo.title
        }
    }
    
    var thumbnailUrl: String {
        get {
            return photo.thumbnailUrl
        }
    }
}
