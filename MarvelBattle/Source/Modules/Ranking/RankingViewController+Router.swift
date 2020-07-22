//
//  RankingViewController+Router.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

extension RankingViewController {
    
    func pushToCharacterProfileView(character: CharacterModel) {
        let characterProfileVC = DefaultViewFactory.shared.getCharacterProfileView(character: character)
        self.navigationController?.pushViewController(characterProfileVC, animated: true)
    }

}
