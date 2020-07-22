//
//  CharactersNetApi.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 20/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import RxSwift

class CharactersNetApi {
    
    init() { }
    
    public func getCharacters(offset: Int, limit: Int, nameStartsWith: String) -> Observable<[CharacterModel]> {
        let request = CharactersNetRequestProvider.getCharacterRequest(offset: offset, limit: limit, nameStartsWith: nameStartsWith)
        return URLRequest.request(resource: request).flatMap { response -> Observable<[CharacterModel]> in
            return Observable.just(response.data.characters)
        }
    }
    
}

struct WrapperMarvelResponse: Decodable {
    
    var code: Int
    var data: WrapperCharacters
    
    private enum CodingKeys: String, CodingKey {
        case code = "code"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(Int.self, forKey: .code)
        self.data = try container.decode(WrapperCharacters.self, forKey: .data)
    }
    
}

struct WrapperCharacters: Decodable {
    
    var characters: [CharacterModel]
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.characters = try container.decode([CharacterModel].self, forKey: .results)
    }
    
}
