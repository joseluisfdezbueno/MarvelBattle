//
//  ArenaViewController+SelectableCharacterDelegate.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

extension ArenaViewController: SelectableCharacterDelegate {
    
    func characterWasSelected(character: CharacterModel) {
        if self.isFirstCharacterSelected {
            self.firstCharacter = character
            self.characterOneSelectTextField.text = character.name
        } else {
            self.secondCharacter = character
            self.characterSecondSelectTextField.text = character.name
        }
        self.view.endEditing(true)
    }
    
}
