//
//  ViewFactoryProtocol.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol ViewFactoryProtocol {

    func getCharacterSearchView(selectableCharacterDelegate: SelectableCharacterDelegate?) -> CharacterSearchViewController
    func getArenaView() -> ArenaViewController
    func getRankingView() -> RankingViewController
    func getCharacterProfileView(character: CharacterModel) -> CharacterProfileViewController
    func getBattleResultView(battleResult: BattleResultType) -> BattleResultViewController

}
