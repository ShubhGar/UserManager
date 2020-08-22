//
//  NetworkDataFetcher.swift
//  MyApplication
//
//  Created by Shubham Garg on 29/01/20.
//  Copyright © 2020 Shubham Garg. All rights reserved.
//

import Foundation
class NetworkDataFetcher: DataFetcherProtocol {
    static var shared: NetworkDataFetcher = NetworkDataFetcher()
    
    private init(){
        
    }
    
    func requestData(url: URL, completion: @escaping (ApiResult) -> Void) {
        let header =  ["Content-Type": "application/x-www-form-urlencoded"]
        
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        urlRequest.allHTTPHeaderFields = header
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print(error)
                completion(ApiResult.failure(.connectionError))
            }else if let data = data ,let responseCode = response as? HTTPURLResponse {
                    switch responseCode.statusCode {
                    case 200:
                        completion(ApiResult.success(data))
                    case 400...499:
                        completion(ApiResult.failure(.authorizationError(data)))
                    case 500...599:
                        completion(ApiResult.failure(.serverError))
                    default:
                        completion(ApiResult.failure(.unknownError))
                        break
                    }
            }
        }.resume()
    }
}
