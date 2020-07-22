//
//  CharactersService.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 20/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import RxSwift

public class CharactersService: CharactersServiceProtocol {

    private let netApi: CharactersNetApi
    private let repository: CharactersRepository

    public init() {
        self.netApi = CharactersNetApi()
        self.repository = CharactersRepository()
    }
    
    public func getCharacters(offset: Int, limit: Int, nameStartsWith: String) -> Observable<[CharacterModel]> {
        return self.netApi.getCharacters(offset: offset, limit: limit, nameStartsWith: nameStartsWith)
    }

    public func fightBetweenCharacters(firstCharacter: CharacterModel, secondCharacter: CharacterModel) -> BattleResultType {
        var result: BattleResultType = .DRAW
        
        if firstCharacter.power > secondCharacter.power {
            result = .WINNER_FIRST
        } else if firstCharacter.power < secondCharacter.power {
            result = .WINNER_SECOND
        }
        self.repository.addCharacterToRanking(character: firstCharacter)
        self.repository.addCharacterToRanking(character: secondCharacter)

        return result
    }
        
    public func getCharactersRanking() -> [CharacterModel] {
        return self.repository.getCharactersRanking()
    }

}
