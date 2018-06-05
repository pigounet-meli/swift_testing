//
//  Singleton.swift
//  SwiftTesting
//
//  Created by Samuel Sainz on 6/5/18.
//

import UIKit

class CartManager: NSObject {
    
    static let sharedInstance = CartManager()
    
    var coreUserDefaults : CoreUserDefaultsProtocol
    
    override init() {
        self.coreUserDefaults = CoreUserDefaults.sharedInstance
    }
    
    func addItemToCart(item : Item?) {
        
        guard let itemToAdd = item else {
            return
        }
        
        let siteId = self.coreUserDefaults.getSiteId()
        // add item using site id (?
    }
    
    func getCartItems() {
        // API Call
        Thread.sleep(forTimeInterval: 5.0)
    }
}
