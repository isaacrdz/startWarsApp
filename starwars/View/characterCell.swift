//
//  characterCell.swift
//  starwars
//
//  Created by Isaac Rodriguez on 12/2/17.
//  Copyright © 2017 Isaac Rodriguez. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {

   
    @IBOutlet weak var characterLabel: UILabel!
    
   
    func configureCell(character : Character) {
        let name = character.characterName ?? ""
        characterLabel.text = name
    }


}
