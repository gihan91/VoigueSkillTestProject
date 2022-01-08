//
//  Storyboard.swift
//  VoigueTestApp
//
//  Created by mac on 8/1/22.
//

import UIKit

protocol Storyboard {
    static func instantiateMain() -> Self
}

extension Storyboard where Self: UIViewController {
    
    static func instantiateMain() -> Self {
        let id = String(describing: self)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(identifier: id) as! Self
    }
}
