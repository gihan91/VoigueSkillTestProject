//
//  LogManager.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit

class LogManager {
    
    static let error: String = "error"
    static let info: String = "info"
    static let warn: String = "warn"
    static let unitTest: String = "unittest"

    static func log(_ type: String, file: String = #file, function: String = #function, line: Int = #line, data: Any) {
        print("::::\(type) in: \(file)->\(function):\(line) => \(data)")
    }
}
