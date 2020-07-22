//
//  CharacterProfilePresenter.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol CharacterProfilePresenterProtocol: class {
    func getCharacterProfile() -> CharacterModel?
}

class CharacterProfilePresenter: CharacterProfilePresenterProtocol {

    private weak var view: CharacterProfileViewControllerProtocol!
    var character: CharacterModel?

    init(view: CharacterProfileViewControllerProtocol) {
        self.view = view
    }
    
    func getCharacterProfile() -> CharacterModel? {
        return self.character
    }
    
}
