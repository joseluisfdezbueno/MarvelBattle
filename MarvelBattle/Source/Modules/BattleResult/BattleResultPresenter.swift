//
//  BattleResultPresenter.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol BattleResultPresenterProtocol: class {
    func getBattleResult() -> String
}

class BattleResultPresenter: BattleResultPresenterProtocol {

    private weak var view: BattleResultViewController!
    private var battleResult: BattleResultType

    init(view: BattleResultViewController, battleResult: BattleResultType) {
        self.view = view
        self.battleResult = battleResult
    }
    
    func getBattleResult() -> String {
        var result: String = ""
        
        switch self.battleResult {
        case .WINNER_FIRST:
            result = "battle_result_view_winner_is_first".localized()
        case .WINNER_SECOND:
            result = "battle_result_view_winner_is_second".localized()
        default:
            result = "battle_result_view_draw".localized()
        }
        return result
    }

}
