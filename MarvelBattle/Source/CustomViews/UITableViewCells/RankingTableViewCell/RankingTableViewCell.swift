//
//  RankingTableViewCell.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

class RankingTableViewCell: UITableViewCell {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var powerLabel: UILabel!
    
    static public var id = "RankingTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func setCell(position: Int, characterName: String, characterPower: Int) {
        self.positionLabel.text = String(format: "ranking_table_view_position".localized(), position)
        self.nameLabel.text = characterName
        self.powerLabel.text = String(format: "ranking_table_view_power".localized(), characterPower)
    }
    
}
