//
//  GetAlbumListRequest.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation
import Alamofire

class GetAlbumListRequest: APIRequest {
    
    public typealias Response = AlbumsResponse
    
    public typealias Error = ErrorResponse
        
    public var resourceName: String {
        return "/albums"
    }
    
    public var method: HTTPMethod {
        return HTTPMethod.get
    }
    
    public var resourcePath: String {
        return ""
    }
            
    public init() {}
}
