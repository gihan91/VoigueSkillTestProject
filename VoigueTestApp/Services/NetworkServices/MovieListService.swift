//
//  MovieListService.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit
import Alamofire

enum MovieListService: APIConfiguration {
    
    case getMovieList(parameters: Parameters)
    case getMovieListInfo(parameters: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getMovieList, .getMovieListInfo:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getMovieList, .getMovieListInfo:
            return "/"
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getMovieList, .getMovieListInfo:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ServerParams.baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        switch self {
        case .getMovieList(let params), .getMovieListInfo(let params):
            urlRequest = try URLEncoding.default.encode(urlRequest, with: params)
        }
        return urlRequest
        
    }
    
    
}
