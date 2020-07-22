//
//  CoreFactoryProtocol.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore

protocol CoreFactoryProtocol {

    func getCharactersService() -> CharactersServiceProtocol

}
