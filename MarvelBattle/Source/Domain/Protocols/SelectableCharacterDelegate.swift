//
//  SelectableCharacterDelegate.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol SelectableCharacterDelegate: class {
   
    func characterWasSelected(character: CharacterModel)
    
}
