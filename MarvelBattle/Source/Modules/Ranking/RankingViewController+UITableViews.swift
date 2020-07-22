//
//  RankingViewController+UITableViews.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension RankingViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.characters.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: RankingTableViewCell.id) as? RankingTableViewCell else {
            return UITableViewCell()
        }
        let character = self.presenter?.characters[indexPath.row]
        cell.setCell(position: indexPath.row + 1, characterName: character?.name ?? "", characterPower: character?.power ?? 0)
        return cell
    }

}

extension RankingViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.characterWasSelected(index: indexPath.row)
    }

}
