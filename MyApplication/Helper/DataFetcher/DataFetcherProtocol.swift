//
//  DataFetcherProtocol.swift
//  MyApplication
//
//  Created by Shubham Garg on 29/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation

protocol DataFetcherProtocol {
    func requestData(url:URL,completion: @escaping (ApiResult)->Void) 
}


typealias parameters = [String:Any]
   
   enum ApiResult {
       case success(Any)
       case failure(RequestError)
   }
   enum HTTPMethod: String {
       case options = "OPTIONS"
       case get     = "GET"
       case head    = "HEAD"
       case post    = "POST"
       case put     = "PUT"
       case patch   = "PATCH"
       case delete  = "DELETE"
       case trace   = "TRACE"
       case connect = "CONNECT"
   }
   enum RequestError: Error {
       case unknownError
       case connectionError
       case authorizationError(Any)
       case invalidRequest
       case notFound
       case invalidResponse
       case serverError
       case serverUnavailable
   }

public enum DataError {
    case internetError(String)
    case serverMessage(String)
}
