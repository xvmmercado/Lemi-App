//
//  APIRouter.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright © 2020 Xander Mercado. All rights reserved.
//

import Foundation
import Alamofire

struct AlamofireManager {
    static let manager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 120
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        configuration.urlCache = nil
        let sessionManager = Alamofire.SessionManager(configuration: configuration)
        return sessionManager
    }()
}

enum APIRouter: URLRequestConvertible {
    
    static let baseURLString = "https://lemi.travel/"
    
    case FetchCities(parameter: Parameters)
    
    //sets the method for each request
    private var method: Alamofire.HTTPMethod {
        switch self {
        case .FetchCities:
            return .get
        }
    }
    
    //sets the url string of each request
    private var path: String {
        switch self {
        case .FetchCities:
            return "api/v5/cities"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
           let url = try APIRouter.baseURLString.asURL()
           var urlRequest = URLRequest(url: url.appendingPathComponent(path))
           urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .FetchCities(let parameters):
            return try Alamofire.URLEncoding.queryString.encode(urlRequest, with: parameters)
        default:
            return urlRequest
        }
    }
}
