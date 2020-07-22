//
//  CharactersNetRequestProvider.swift
//  MarvelCore
//
//  Created by Jose Luis Fernandez on 20/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import Foundation

class CharactersNetRequestProvider {

    private static let charactersEndpoint = "/characters"
    
    static func getCharacterRequest(offset: Int, limit: Int, nameStartsWith: String) -> Resource<WrapperMarvelResponse> {
        let privateKey = Constants.Net.marvelApiPrivateKey
        let publicKey = Constants.Net.marvelApiPublicKey
        let timestamp = Date().currentTimeInMillis()
        let md5 = "\(timestamp)\(privateKey)\(publicKey)".md5()
        var queryParams = "?limit=\(limit)&offset=\(offset)&ts=\(timestamp)&apikey=\(publicKey)&hash=\(md5)"
        
        if nameStartsWith != "" {
            queryParams.append(contentsOf: "&nameStartsWith=\(nameStartsWith)")
        }
        let url = Constants.Net.baseUrl + charactersEndpoint + queryParams
        return Resource<WrapperMarvelResponse>(url: URL(string: url)!)
    }
    
}
