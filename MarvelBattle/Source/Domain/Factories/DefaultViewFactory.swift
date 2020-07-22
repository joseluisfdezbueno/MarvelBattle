//
//  DefaultViewFactory.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

class DefaultViewFactory: ViewFactoryProtocol {
    
    static var shared: DefaultViewFactory = DefaultViewFactory()
    
    private init() { }
    
    func getCharacterSearchView(selectableCharacterDelegate: SelectableCharacterDelegate? = nil) -> CharacterSearchViewController {
        let view = CharacterSearchViewController()
        let presenter = CharacterSearchPresenter(view: view, delegate: selectableCharacterDelegate)
        view.presenter = presenter
        return view
    }
    
    func getArenaView() -> ArenaViewController {
        let view = ArenaViewController()
        let presenter = ArenaPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func getRankingView() -> RankingViewController {
        let view = RankingViewController()
        let presenter = RankingPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func getCharacterProfileView(character: CharacterModel) -> CharacterProfileViewController {
        let view = CharacterProfileViewController()
        let presenter = CharacterProfilePresenter(view: view)
        presenter.character = character
        view.presenter = presenter
        return view
    }
    
    func getBattleResultView(battleResult: BattleResultType) -> BattleResultViewController {
        let view = BattleResultViewController()
        let presenter = BattleResultPresenter(view: view, battleResult: battleResult)
        view.presenter = presenter
        return view
    }

}
