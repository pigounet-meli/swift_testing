//
//  CoreUserDefaults.swift
//  SwiftTesting
//
//  Created by Samuel Sainz on 6/5/18.
//

import UIKit

protocol CoreUserDefaultsProtocol {
    func getSiteId() -> String
}

final class CoreUserDefaults : CoreUserDefaultsProtocol {
    static let sharedInstance = CoreUserDefaults()
    
    func getSiteId() -> String {
        return "MLU"
    }
    
    private init() {}
}
