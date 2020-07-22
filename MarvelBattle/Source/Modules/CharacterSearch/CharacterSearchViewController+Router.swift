//
//  CharacterSearchViewController+Router.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

extension CharacterSearchViewController {
    
    func pushToCharacterProfileView(character: CharacterModel) {
        let characterProfileVC = DefaultViewFactory.shared.getCharacterProfileView(character: character)
        self.navigationController?.pushViewController(characterProfileVC, animated: true)
    }
    
    func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
