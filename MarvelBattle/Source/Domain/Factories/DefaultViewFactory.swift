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
    
    func getCharacterSearchView(selectableCharacterDelegate: SelectableCharacterDelegate? = nil) -> CharacterSearchViewControllerProtocol {
        let view = CharacterSearchViewController()
        let presenter = CharacterSearchPresenter(view: view, delegate: selectableCharacterDelegate)
        view.presenter = presenter
        return view
    }
    
    func getArenaView() -> ArenaViewControllerProtocol {
        let view = ArenaViewController()
        let presenter = ArenaPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func getRankingView() -> RankingViewControllerProtocol {
        let view = RankingViewController()
        let presenter = RankingPresenter(view: view)
        view.presenter = presenter
        return view
    }
    
    func getCharacterProfileView(character: CharacterModel) -> CharacterProfileViewControllerProtocol {
        let view = CharacterProfileViewController()
        let presenter = CharacterProfilePresenter(view: view)
        presenter.character = character
        view.presenter = presenter
        return view
    }
    
    func getBattleResultView(battleResult: BattleResultType) -> BattleResultViewControllerProtocol {
        let view = BattleResultViewController()
        let presenter = BattleResultPresenter(view: view, battleResult: battleResult)
        view.presenter = presenter
        return view
    }

}
