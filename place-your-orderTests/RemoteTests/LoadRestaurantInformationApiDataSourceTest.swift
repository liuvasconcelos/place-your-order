//
//  LoadRestaurantInformationApiDataSourceTest.swift
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

class LoadRestaurantInformationApiDataSourceTest: QuickSpec {
    
    override func spec() {
        var apiDataSource: RestaurantApiDataSourceImpl?
        let companyId = 121
        
        
        beforeEach {
            apiDataSource = nil
            apiDataSource = RestaurantApiDataSourceImpl.shared
        }
        
        describe("#loadRestaurant") {
            var result: CompanyInformation?
            var successCallback = false
            var emptyCallback   = false
            var failCallBack    = false
            
            let loadRestaurantAction: Action = Action() {
                successCallback = false
                emptyCallback   = false
                failCallBack    = false
                apiDataSource!
                    .loadRestaurantInformationBy(id: companyId, { (callback) in
                        callback.onSuccess({ (companyInformation) in
                            result = companyInformation
                            successCallback = true
                        })
                        
                        callback.onEmptyData {
                            emptyCallback = true
                        }
                        
                        callback.onFailed({ (error) in
                            failCallBack = true
                        })
                    })
            }
            
            context("when api data source results in success") {
                beforeEach {
                    execute(action: loadRestaurantAction, {
                        self.setupMockApi(json: ApiMocks.companyJson, code: 200)
                    })
                }
                
                it("callback should result in a success") {
                    expect(successCallback).toEventually(be(true), timeout: 3.0)
                    expect(emptyCallback).toEventually(be(false), timeout: 3.0)
                    expect(failCallBack).toEventually(be(false), timeout: 3.0)

                    expect(result?.numericalId).toEventually(be(121), timeout: 3.0, pollInterval: 3.0)
                    expect(result?.latitude).toEventually(match("-23.5953990000"), timeout: 3.0)
                    expect(result?.longitude).toEventually(match("-46.6866780000"), timeout: 3.0)
//                    expect(result?.openingTimes.first?.timeFrom).toEventually(match("12:00"), timeout: 3.0)
//                    expect(result?.images?.first?.context).toEventually(match("company-thumbnail-small"), timeout: 3.0)
                    expect(result?.address).toEventually(match("R. Olimpíadas, 360 Praça de Alimentação - São Paulo, SP - 04551000"), timeout: 3.0)
                    expect(result?.id).toEventually(match("https://api.staging.onyo.com/v1/mobile/company/121"), timeout: 3.0)
//                    expect(result?.categories?.first?.name).toEventually(match("Boats e Combinados_old"), timeout: 3.0)
                    expect(result?.displayName).toEventually(match("Shopping Vila Olímpia"), timeout: 3.0)
                    expect(result?.name).toEventually(match("Gendai Vila Olímpia"), timeout: 3.0)
                    expect(result?.menuBrand).toEventually(match("https://api.staging.onyo.com/v1/mobile/brand/29"), timeout: 3.0)
//                    expect(result?.menus?.first?.numericalId).toEventually(be(30), timeout: 3.0, pollInterval: 3.0)
                    expect(result?.brand).toEventually(match("https://api.staging.onyo.com/v1/mobile/brand/29"), timeout: 3.0)
                }
            }
            
            context("when pass invalid id and api data source results in empty result") {
                beforeEach {
                    execute(action: loadRestaurantAction, {
                        self.setupMockApi(json: [:], code: 404)
                    })
                }
                
                it("callback should call an empty method") {
                    expect(emptyCallback).toEventually(be(true), timeout: 3.0)
                    expect(failCallBack).toEventually(be(false), timeout: 3.0)
                    expect(successCallback).toEventually(be(false), timeout: 3.0)
                }
            }
        }
        
    }
    
    fileprivate func setupMockApi(json: [String: Any], code: Int32) {
        stub(condition: isHost("api.staging.onyo.com") && isPath("/v1/mobile/company/121")) { _ in
            return OHHTTPStubsResponse(jsonObject: json,
                                       statusCode: code,
                                       headers: .none)
        }
    }
}
