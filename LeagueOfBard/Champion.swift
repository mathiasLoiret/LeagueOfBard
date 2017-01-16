//
//  Champion.swift
//  LeagueOfBard
//
//  Created by iMacFabLab on 10/01/2017.
//  Copyright © 2017 iMacFabLab. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Champion {
    let name : String
    let title : String
    let image : String
    let id : Int
    let spells = [Spell]()
    
    init(json: JSON) {
        self.name = json["name"].stringValue
        self.title = json["title"].stringValue
        self.image = json["image"]["full"].stringValue
        self.id = json["id"].intValue
    }
    
    func getImageURL() -> String {
        return "http://ddragon.leagueoflegends.com/cdn/7.1.1/img/champion/" + self.image
    }
}
