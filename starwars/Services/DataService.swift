//
//  DataService.swift
//  starwars
//
//  Created by Isaac Rodriguez on 12/3/17.
//  Copyright © 2017 Isaac Rodriguez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class DataService {
    
    static let instance = DataService()
    var characters = [Character]()
    
    func getAllCharacters(completion: @escaping CompletionHandler){
        Alamofire.request(baseURL, method: .get).responseJSON { response in
            debugPrint(response)
            if(response.result.isSuccess){
                if let data = response.result.value{
                    let json = JSON(data)
                    if let characters = json["results"].array {
                        for character in characters {
                            self.characters.append(Character(fromJSON: character) )
                        }
                        completion(true)
                    }
                }
            }
        }
        completion(false)
    }
}
