//
//  CharacterTableViewCell.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    static public var id = "CharacterTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setCell(characterName: String) {
        self.nameLabel.text = characterName
    }
    
}
