//
//  NetworkManager.swift
//  LeagueOfBard
//
//  Created by iMacFabLab on 10/01/2017.
//  Copyright © 2017 iMacFabLab. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias ServiceResponse = ((JSON, Error?) -> Void)
class NetworkManager {
    static let sharedInstance = NetworkManager()
    fileprivate init() {}
    
    func callApi(_ completion: @escaping ServiceResponse) {
        let apiToContact = "https://global.api.pvp.net/api/lol/static-data/euw/v1.2/champion?champData=image&api_key=RGAPI-4edca6b7-fd8f-4e5a-a9d8-2ced1052fb56"
        Alamofire.request(apiToContact).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("data is \(json)")
                    completion(json, nil)
                    // Do what you need to with JSON here!
                    // The rest is all boiler plate code you'll use for API requests
                    
                }
            case .failure(let error):
                print(error)
                completion(nil, error)
            }
        }
    }
}
