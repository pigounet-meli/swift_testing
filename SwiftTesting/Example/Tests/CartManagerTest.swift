//
//  CartManagerTest.swift
//  SwiftTesting_Tests
//
//  Created by Samuel Sainz on 6/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import SwiftTesting

extension CartManager {
    convenience init(coreUserDefaults : CoreUserDefaultsProtocol) {
        self.init()
        self.coreUserDefaults = coreUserDefaults
    }
}

class CoreUserDefaultsMock : CoreUserDefaultsProtocol {
    var getSiteIdCalled = false
    
    func getSiteId() -> String {
        getSiteIdCalled = true
        return "MLU"
    }
}

class CartManagerMock: CartManager {
    var getCartItemsCalled = false
    
    override func getCartItems() {
        getCartItemsCalled = true
    }
}

class CartManagerTest: QuickSpec {
    override func spec() {
        describe("cart manager") {
            it("User defaults dependency injection to Cart Manager") {
                // given
                let item = Item(name: "Name", price: "$10.0", description: "Cool item")
                let coreUserDefaultsMock = CoreUserDefaultsMock()
                
                // when
                CartManager(coreUserDefaults: coreUserDefaultsMock).addItemToCart(item: item)
                
                // then
                expect(coreUserDefaultsMock.getSiteIdCalled).to(beTrue())
            }
            
            it("Cart manager stub") {
                
                // given
                let cartManagerMock = CartManagerMock()
                
                //when
                cartManagerMock.getCartItems()
                
                // then
                expect(cartManagerMock.getCartItemsCalled).to(beTrue())
            }
            
            it("Function not called") {
                // given
                let cartManagerMock = CartManagerMock()
                
                //when
                cartManagerMock.addItemToCart(item: nil)
                
                // then
                expect(cartManagerMock.getCartItemsCalled).to(beFalse())
            }
        }
    }
}
