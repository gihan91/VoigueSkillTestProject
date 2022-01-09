//
//  APIErrorManager.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit

class APIErrorManager {
    
    static func handleError(statusCode: Int) {
        switch statusCode {
        case 401:
            LogManager.log(LogManager.error, data: "Auth Error: \(statusCode)")
        case -1009, -1005:
            LogManager.log(LogManager.error, data: "No internet Error: \(statusCode)")
        case -1000, -1001, -1002, -1003:
            LogManager.log(LogManager.error, data: "Cant connect: \(statusCode)")
        default:
            LogManager.log(LogManager.warn, data: "Something went wrong: \(statusCode)")
        }
    }
}
