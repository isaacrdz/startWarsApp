//
//  ViewController.swift
//  starwars
//
//  Created by Isaac Rodriguez on 12/2/17.
//  Copyright © 2017 Isaac Rodriguez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class CharacterVC: UIViewController,UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    var characterArray:[Character] = [Character]()
    
    let character = Character()
    
    let baseURL = "https://swapi.co/api/people"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        getAllCharacters(url: baseURL)
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterCell {
            
            
            
          
            
            return cell
        }
        
        return CharacterCell()
    }
    
    func getAllCharacters(url: String){
        
        Alamofire.request(url, method: .get).responseJSON {
            response in
            
            if response.result.isSuccess {
                print("Got Character Data!")
                
                let characterJSON: JSON = JSON(response.result.value!)
                
                self.updateCharacterData(json: characterJSON)
               
            } else {
                print("Error")
            }
            
        }
    }

    func updateCharacterData(json: JSON){
        character.name = json["results"]["name"].stringValue
        
        
        
    }
    
    //MARK: - UI Updates
    /***************************************************************/
    
   
   


}

