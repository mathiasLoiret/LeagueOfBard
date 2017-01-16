//
//  Spell.swift
//  LeagueOfBard
//
//  Created by iMacFabLab on 10/01/2017.
//  Copyright © 2017 iMacFabLab. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Spell {

    let name: String
    let description: String
    let image: String
    let range: String
    
    init(json: JSON, n: String){
        
        self.name=json["spells"][n]["name"].stringValue
        self.description=json["spells"][n]["description"].stringValue
        self.image=json["spells"][n]["image"]["full"].stringValue
        self.range=json["spells"][n]["range"][0].stringValue

    }
}
