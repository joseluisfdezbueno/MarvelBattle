//
//  CharacterModel.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import RealmSwift

public class CharacterModel: Object, Decodable {
    @objc public dynamic var name: String?
    @objc public dynamic var biography: String?
    @objc public dynamic var power: Int
    @objc public dynamic var imageUrl: String?
        
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case image = "thumbnail"
        case comics = "comics"
    }
    
    private enum ThumbnailCodingKeys: String, CodingKey {
        case url = "path"
        case fileExtension = "extension"
    }
    
    private enum ComicsCodingKeys: String, CodingKey {
        case comicsCount = "available"
    }
    
    required public init() {
        self.name = ""
        self.biography = ""
        self.power = 0
        self.imageUrl = ""
    }
    
    public init(name: String?, biography: String, power: Int, imageUrl: String?) {
        self.name = name
        self.biography = biography
        self.power = power
        self.imageUrl = imageUrl
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try? decoder.container(keyedBy: CodingKeys.self)
        self.name = try? container?.decode(String.self, forKey: .name)
        
        if let description = try? container?.decode(String.self, forKey: .description), description != "" {
            self.biography = description
        }
        
        let imageContainer = try? container?.nestedContainer(keyedBy: ThumbnailCodingKeys.self, forKey: .image)
        if let url = try? imageContainer?.decode(String.self, forKey: .url),
           let fileExtension = try? imageContainer?.decode(String.self, forKey: .fileExtension) {
            self.imageUrl = "\(url).\(fileExtension)"
        }
        
        let comicsContainer = try? container?.nestedContainer(keyedBy: ComicsCodingKeys.self, forKey: .comics)
        self.power = (try? comicsContainer?.decode(Int.self, forKey: .comicsCount)) ?? 0
    }

}
