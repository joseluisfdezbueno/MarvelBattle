//
//  CharactersRepository.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import RealmSwift

class CharactersRepository {
        
    init() { }
    
    func addCharacterToRanking(character: CharacterModel) {
        do {
            let realm = try Realm()
            let ranking = realm.objects(CharacterModel.self)
                        
            try realm.write {
                if !ranking.contains { auxCharacter -> Bool in
                    auxCharacter.name == character.name
                    } {
                    realm.add(character)
                }
            }
        } catch {
            print("(CharactersRepository) - Error in addCharacterToRanking")
        }
    }
    
    func getCharactersRanking() -> [CharacterModel] {
        do {
            let realm = try Realm()
            let ranking = realm.objects(CharacterModel.self).sorted(byKeyPath: "power", ascending: false)
            return Array(ranking)
        } catch {
            return []
        }
    }
    
}
