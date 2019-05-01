//
//  LoadRestaurantProductsByCompanyIdApiDataSourceTest.swift
//  place-your-orderTests
//
//  Created by Livia Vasconcelos on 01/05/19.
//  Copyright © 2019 Livia Vasconcelos. All rights reserved.
//

import Foundation
import Quick
import Nimble
import OHHTTPStubs
@testable import place_your_order

class LoadRestaurantProductsByCompanyIdApiDataSourceTest: QuickSpec {
    
    override func spec() {
        var apiDataSource: RestaurantApiDataSourceImpl?
        let companyId = 121
        
        beforeEach {
            apiDataSource = nil
            apiDataSource = RestaurantApiDataSourceImpl.shared
        }
        
        describe("#loadProducts") {
            var result: ProductList?
            var successCallback = false
            var failCallBack    = false
            
            let loadProductsAction: Action = Action() {
                successCallback = false
                failCallBack    = false
                apiDataSource!
                    .loadRestaurantProductsBy(companyId: companyId, { (callback) in
                        callback.onSuccess({ (products) in
                            result = products
                            successCallback = true
                        })
                        
                        callback.onFailed({ (error) in
                            failCallBack = true
                        })
                    })
            }
            
            context("when api data source results in success") {
                beforeEach {
                    execute(action: loadProductsAction, {
                        self.setupMockApi(json: ApiMocks.productsJson, code: 200)
                    })
                }
                
                it("callback should result in a success") {
                    expect(successCallback).toEventually(be(true), timeout: 3.0)
                    expect(failCallBack).toEventually(be(false), timeout: 3.0)
                    
                    expect(result?.products?.first?.name).toEventually(match("1/2 FRANGO KARAAGUE DOMBURI C/ LEGS REFOGADOS"), timeout: 3.0)
                    expect(result?.products?.first?.description).toEventually(match("Arroz branco com frango frito à moda oriental e legumes refogados"), timeout: 3.0)
                    expect(result?.products?.first?.price).toEventually(match("19.90"), timeout: 3.0)
                    expect(result?.products?.first?.images?.first?.context).toEventually(match("company-thumbnail-small"), timeout: 3.0)
                    expect(result?.products?.first?.category).toEventually(match("https://api.staging.onyo.com/v1/mobile/category/279"), timeout: 3.0)
                }
            }
            
            context("when pass invalid id and api data source results in failure") {
                beforeEach {
                    execute(action: loadProductsAction, {
                        self.setupMockApi(json: [:], code: 404)
                    })
                }
                
                it("callback should result in an error") {
                    expect(failCallBack).toEventually(be(true), timeout: 3.0)
                    expect(successCallback).toEventually(be(false), timeout: 3.0)
                }
            }
        }
        
    }
    
    fileprivate func setupMockApi(json: [String: Any], code: Int32) {
        stub(condition: isHost("api.staging.onyo.com") && isPath("/v2/mobile/company/121/products")) { _ in
            return OHHTTPStubsResponse(jsonObject: json,
                                       statusCode: code,
                                       headers: .none)
        }
    }
}

