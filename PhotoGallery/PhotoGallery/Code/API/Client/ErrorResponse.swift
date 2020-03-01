//
//  ErrorResponse.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

struct ErrorResponse {
    let error: Error?
    let errorString = "ERROR_SERVER".localized()
}
