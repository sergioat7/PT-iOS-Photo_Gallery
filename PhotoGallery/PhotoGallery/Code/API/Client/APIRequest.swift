//
//  APIRequest.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation
import Alamofire

public protocol APIRequest {
    
    associatedtype Response: Decodable

    // Endpoint for this request (the last part of the URL)
    var resourceName: String { get }
    
    //HTTP Method
    var method: HTTPMethod { get }
    
    //Parameters to be appended in url
    var resourcePath: String { get }
}
