//
//  AlbumCellViewModel.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 01/03/2020.
//  Copyright (c) 2020. All rights reserved.
//

class AlbumCellViewModel: BaseViewModel {

    private let album: AlbumResponse
    
    init(album: AlbumResponse) {
        self.album = album
    }
    
    var id: Int64 {
        get {
            return album.id
        }
    }
    
    var title: String {
        get {
            return album.title
        }
    }
}
