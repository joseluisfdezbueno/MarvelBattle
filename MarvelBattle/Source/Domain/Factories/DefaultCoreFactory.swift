//
//  DefaultCoreFactory.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

class DefaultCoreFactory: CoreFactoryProtocol {
    
    static var shared: DefaultCoreFactory = DefaultCoreFactory()
    
    private init() { }
    
    func getCharactersService() -> CharactersServiceProtocol {
        return CharactersService()
    }

}
