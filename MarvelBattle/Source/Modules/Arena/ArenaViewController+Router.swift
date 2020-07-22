//
//  ArenaViewController+Router.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

extension ArenaViewController {
    
    func presentCharacterSearchView(forFirstCharacter: Bool) {
        self.view.endEditing(true)
        self.isFirstCharacterSelected = forFirstCharacter
        let searchView = DefaultViewFactory.shared.getCharacterSearchView(selectableCharacterDelegate: self)
        self.present(searchView, animated: true)
    }
    
    func presentBattleResultView(result: BattleResultType) {
        let battleResultView = DefaultViewFactory.shared.getBattleResultView(battleResult: result)
        battleResultView.modalPresentationStyle = .overFullScreen
        battleResultView.modalTransitionStyle = .crossDissolve
        self.present(battleResultView, animated: true)
    }
    
}
