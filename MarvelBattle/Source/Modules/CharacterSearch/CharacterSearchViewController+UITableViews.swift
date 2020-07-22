//
//  CharacterSearchViewController+UITableViews.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//
import UIKit

extension CharacterSearchViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.characters.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.id) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        cell.setCell(characterName: self.presenter?.characters[indexPath.row].name ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let limit = (self.presenter?.characters.count ?? 0) - 1
        
        if presenter?.canAskMoreCharacters() == true, indexPath.row == limit {
            tableView.showSpinnerLoading()
            self.presenter?.getMoreCharacters(nameStartsWith: self.searchBar.text ?? "")
        }
    }
}

extension CharacterSearchViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.characterWasSelected(index: indexPath.row)
    }

}
