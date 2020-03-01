//
//  GetPhotoRequest.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation
import Alamofire

class GetPhotoRequest: APIRequest {
    
    public typealias Response = PhotoResponse
    
    public typealias Error = ErrorResponse
        
    public var resourceName: String {
        return "/photos"
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var resourcePath: String
            
    public init(photoId: Int64) {
        self.resourcePath = String(format: "/%ld", photoId)
    }
}
