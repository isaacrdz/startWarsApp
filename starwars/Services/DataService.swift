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
        
        Alamofire.request(baseURL, method: .get).responseJSON {
            response in
            
            if response.result.error == nil {
                
                
                
                guard let data = response.data else { return }
                
                do {
                    if let json = try JSON( data: data).array {
                        for item in json {
                            let name = item["name"].stringValue
                            
                            
                            let character = Character(characterName: name)
                            
                            self.characters.append(character)
                        }
                        print(self.characters[0].characterName)
                        completion(true)
                    }
                } catch {
                    print("error")
                }
                
                
                
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        
    }
    } }
