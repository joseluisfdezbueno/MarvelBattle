//
//  ArenaViewController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import MarvelCore

class ArenaViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var characterOneTitleLabel: UILabel!
    @IBOutlet weak var characterOneSelectTextField: UITextField!
    @IBOutlet weak var characterSecondTitleLabel: UILabel!
    @IBOutlet weak var characterSecondSelectTextField: UITextField!
    @IBOutlet weak var fightButton: UIButton!
    
    var isFirstCharacterSelected: Bool = true
    var firstCharacter: CharacterModel?
    var secondCharacter: CharacterModel?

    private let disposeBag = DisposeBag()
    var presenter: ArenaPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.localize()
        self.applyDefaultNavigationBarStyle()
        self.setUpView()
    }

    private func localize() {
        self.title = "arena_view_title".localized()
        self.titleLabel.text = "arena_view_title_label".localized()
        self.characterOneTitleLabel.text = "arena_view_character_one_title_label".localized()
        self.characterOneSelectTextField.placeholder = "arena_view_character_placeholder_text_field".localized()
        self.characterSecondTitleLabel.text = "arena_view_character_second_title_label".localized()
        self.characterSecondSelectTextField.placeholder = "arena_view_character_placeholder_text_field".localized()
        self.fightButton.setTitle("arena_view_character_fight_button".localized(), for: .normal)
    }
    
    private func setUpView() {
        self.fightButton.rx.tap.subscribe(onNext: {
            if let firstCharacter = self.firstCharacter, let secondCharacter = self.secondCharacter {
                self.presenter?.fightBetweenCharacters(firstCharacter: firstCharacter, secondCharacter: secondCharacter)
            }
        }).disposed(by: self.disposeBag)
    
        self.characterOneSelectTextField.rx.controlEvent([.editingDidBegin])
        .asObservable()
        .subscribe(onNext: {
            self.presentCharacterSearchView(forFirstCharacter: true)
        }).disposed(by: disposeBag)
        
        self.characterSecondSelectTextField.rx.controlEvent([.editingDidBegin])
        .asObservable()
        .subscribe(onNext: {
            self.presentCharacterSearchView(forFirstCharacter: false)
        }).disposed(by: disposeBag)
    }
        
}
