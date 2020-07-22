//
//  RankingViewController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit
import MarvelCore

protocol RankingViewControllerProtocol: UIViewController {
    func realoadList()
    func pushToCharacterProfileView(character: CharacterModel)
}

class RankingViewController: UIViewController, RankingViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: RankingPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localize()
        self.applyDefaultNavigationBarStyle()
        self.setUpTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter?.getRankingCharacters()
    }
    
    private func localize() {
        self.title = "ranking_view_title".localized()
    }
    
    private func setUpView() {
        self.setUpTableView()
    }
    
    private func setUpTableView() {
        self.tableView.tableFooterView = UIView(frame: .zero)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: RankingTableViewCell.id, bundle: nil), forCellReuseIdentifier: RankingTableViewCell.id)
    }
    
    func realoadList() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
