//
//  CharactersServiceProtocol.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 20/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import RxSwift

public protocol CharactersServiceProtocol {
    
    func getCharacters(offset: Int, limit: Int, nameStartsWith: String) -> Observable<[CharacterModel]>
    func fightBetweenCharacters(firstCharacter: CharacterModel, secondCharacter: CharacterModel) -> BattleResultType
    func getCharactersRanking() -> [CharacterModel]

}
