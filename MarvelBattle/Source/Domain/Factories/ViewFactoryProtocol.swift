//
//  ViewFactoryProtocol.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol ViewFactoryProtocol {

    func getCharacterSearchView(selectableCharacterDelegate: SelectableCharacterDelegate?) -> CharacterSearchViewControllerProtocol
    func getArenaView() -> ArenaViewControllerProtocol
    func getRankingView() -> RankingViewControllerProtocol
    func getCharacterProfileView(character: CharacterModel) -> CharacterProfileViewControllerProtocol
    func getBattleResultView(battleResult: BattleResultType) -> BattleResultViewControllerProtocol

}
