//
//  GetPhotoListRequest.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation
import Alamofire

class GetPhotoListRequest: APIRequest {
    
    public typealias Response = PhotosResponse
    
    public typealias Error = ErrorResponse
        
    public var resourceName: String {
        return "/albums"
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var resourcePath: String
            
    public init(albumId: Int64) {
        self.resourcePath = String(format: "/%ld", albumId) + "/photos"
    }
}
