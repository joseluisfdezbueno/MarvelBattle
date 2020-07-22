//
//  RankingPresenter.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol RankingPresenterProtocol: class {
    func getRankingCharacters()
    func characterWasSelected(index: Int)
}

class RankingPresenter: RankingPresenterProtocol {

    private lazy var charactersService: CharactersServiceProtocol = DefaultCoreFactory.shared.getCharactersService()
    weak private var view: RankingViewController!
    
    var characters: [CharacterModel] = []

    init(view: RankingViewController) {
        self.view = view
    }
    
    func getRankingCharacters() {
        self.characters = self.charactersService.getCharactersRanking()
        self.view.realoadList()
    }

    func characterWasSelected(index: Int) {
        self.view.pushToCharacterProfileView(character: self.characters[index])
    }
    
}
