//
//  CharacterSearchPresenter.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 19/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import MarvelCore
import RxSwift

protocol CharacterSearchPresenterProtocol: class {
    func getMoreCharacters(nameStartsWith: String)
    func canAskMoreCharacters() -> Bool
    func characterWasSelected(index: Int)
}

class CharacterSearchPresenter: CharacterSearchPresenterProtocol {

    private weak var view: CharacterSearchViewControllerProtocol!
    private lazy var charactersService: CharactersServiceProtocol = DefaultCoreFactory.shared.getCharactersService()
    private weak var selectableCharacterDelegate: SelectableCharacterDelegate?
    private let disposeBag = DisposeBag()

    private var offset: Int = 0
    private var limit: Int = 40
    private var lastNameSearch: String = ""
    private var isThereMoreCharacters: Bool = true
    private var isLoading: Bool = false
    var characters: [CharacterModel] = []

    init(view: CharacterSearchViewControllerProtocol, delegate: SelectableCharacterDelegate?) {
        self.view = view
        self.selectableCharacterDelegate = delegate
    }
    
    private func resetValues() {
        self.isThereMoreCharacters = true
        self.offset = 0
        self.characters.removeAll()
    }
    
    func canAskMoreCharacters() -> Bool {
        return !self.isLoading && self.isThereMoreCharacters
    }

    func getMoreCharacters(nameStartsWith: String) {
        if nameStartsWith != self.lastNameSearch {
            self.lastNameSearch = nameStartsWith
            self.resetValues()
        }
        if self.isThereMoreCharacters {
            self.isLoading = true
            self.charactersService.getCharacters(offset: self.offset, limit: self.limit, nameStartsWith: nameStartsWith).subscribe(onNext: { characters in
                self.offset += self.limit
                self.isThereMoreCharacters = characters.count == self.limit
                self.characters.append(contentsOf: characters)
                self.view.refreshCharacters()
            }, onError: { (error) in
                self.view.showDefaultAlert()
            }, onCompleted: {
                self.isLoading = false
            }).disposed(by: self.disposeBag)
        }
    }
    
    func characterWasSelected(index: Int) {
        if let delegate = self.selectableCharacterDelegate  {
            delegate.characterWasSelected(character: self.characters[index])
            self.view.dismissView()
        } else {
            self.view.pushToCharacterProfileView(character: self.characters[index])
        }
    }

}
