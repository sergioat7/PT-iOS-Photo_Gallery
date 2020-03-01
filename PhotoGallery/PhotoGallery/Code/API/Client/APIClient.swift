//
//  APIClient.swift
//  PhotoGallery
//
//  Created by Sergio Aragonés on 29/02/2020.
//  Copyright (c) 2020. All rights reserved.
//

import Foundation
import Alamofire

public class APIClient {
    
    static let shared = APIClient()
    
    let session = Session(configuration: URLSessionConfiguration.default)
    public var baseEndpoint: String {
        return "https://jsonplaceholder.typicode.com"
    }
    
    func sendServer<T: APIRequest>(_ request: T,
                                   success: @escaping (T.Response) -> Void,
                                   failure: @escaping (ErrorResponse) -> Void) {
        
        let endpoint = self.endpoint(for: request)
        let method = request.method
        
        let request = session.request(endpoint, method: method, encoding: JSONEncoding.default).validate()
        request.responseJSON { response in
            
            if let data = response.data {
                do {
                    let response = try JSONDecoder().decode(T.Response.self, from: data)
                    success(response)
                    return
                } catch {
                    let errorResponse = ErrorResponse(error: nil)
                    failure(errorResponse)
                    return
                }
            } else if let error = response.error {
                let errorResponse = ErrorResponse(error: error)
                failure(errorResponse)
                return
            }
        }
    }
    
    // MARK: - Private functions
    
    private func endpoint<T: APIRequest>(for request: T) -> URL {
        
        let urlString = "\(baseEndpoint)\(request.resourceName)\(request.resourcePath)"
        return URL(string: urlString)!
    }
    
}
