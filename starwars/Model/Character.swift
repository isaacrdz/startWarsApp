//
//  Character.swift
//  starwars
//
//  Created by Isaac Rodriguez on 12/2/17.
//  Copyright © 2017 Isaac Rodriguez. All rights reserved.
//

import Foundation

import SwiftyJSON

struct Character{
    var characterName:String?
    
    init(fromJSON json:JSON){
        if json.isEmpty {return}
        characterName = json["name"].stringValue
    }
}
