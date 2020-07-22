//
//  CharacterProfileViewController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

class CharacterProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    var presenter: CharacterProfilePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localize()
        self.getCharacterProfile()
    }

    private func localize() {
        self.title = "character_pofile_view_title".localized()
    }

    private func getCharacterProfile() {
        let character = self.presenter?.getCharacterProfile()
        
        self.nameLabel.text = character?.name
        self.descriptionTextView.text = character?.biography ?? "character_profile_view_no_description".localized()
        self.avatarImageView.loadRemoteImage(url: character?.imageUrl)
    }

}
