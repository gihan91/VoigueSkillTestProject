//
//  APIConfiguration.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
