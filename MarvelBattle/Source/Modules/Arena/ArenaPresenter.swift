//
//  ArenaPresenter.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol ArenaPresenterProtocol: class {
    func fightBetweenCharacters(firstCharacter: CharacterModel, secondCharacter: CharacterModel)
}

class ArenaPresenter: ArenaPresenterProtocol {
    
    private lazy var charactersService: CharactersServiceProtocol = DefaultCoreFactory.shared.getCharactersService()
    weak private var view: ArenaViewControllerProtocol!

    init(view: ArenaViewControllerProtocol) {
        self.view = view
    }

    func fightBetweenCharacters(firstCharacter: CharacterModel, secondCharacter: CharacterModel) {
        let result = self.charactersService.fightBetweenCharacters(firstCharacter: firstCharacter, secondCharacter: secondCharacter)
        self.view.presentBattleResultView(result: result)
    }
    
}
