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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.getAllCharacters { (Success) in
            
        }
        
    }
    
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as? CharacterCell {
            
            
            
            let character = DataService.instance.characters[indexPath.row]
            
            cell.configureCell(character: character)
            
          
            
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
                print(characterJSON)
                
            } else {
                print("Error")
            }
            
        }
    }

   

   
    

}
