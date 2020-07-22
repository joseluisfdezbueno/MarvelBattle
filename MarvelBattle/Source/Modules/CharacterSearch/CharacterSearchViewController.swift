//
//  CharacterSearchViewController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import MarvelCore

protocol CharacterSearchViewControllerProtocol: UIViewController {
    func refreshCharacters()
    func showDefaultAlert()
    func dismissView()
    func pushToCharacterProfileView(character: CharacterModel)
}

class CharacterSearchViewController: UIViewController, CharacterSearchViewControllerProtocol {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewBottomConstraint: NSLayoutConstraint!
    
    private let disposeBag = DisposeBag()
    
    var presenter: CharacterSearchPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.localize()
        self.applyDefaultNavigationBarStyle()
        self.setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObservers()
    }
    
    private func localize() {
        self.title = "search_view_title".localized()
        self.searchBar.placeholder = "search_view_search_bar_placeholder".localized()
    }
    
    private func setUpView() {
        self.setUpTableView()
        self.setUpSearchBar()
    }
    
    private func setUpSearchBar() {
        if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
            cancelButton.setTitle("accept".localized(), for: .normal)
            cancelButton.setTitleColor(UIColor.appColor(.primaryColor), for: .normal)
        }

        self.searchBar.rx.text.orEmpty
            .debounce(.milliseconds(300), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .subscribe(onNext: {
                self.presenter?.getMoreCharacters(nameStartsWith: $0)
            }).disposed(by: self.disposeBag)

        self.searchBar.rx.cancelButtonClicked.subscribe(onNext: {
            self.view.endEditing(true)
        }).disposed(by: self.disposeBag)
        
        self.searchBar.rx.searchButtonClicked.subscribe(onNext: {
            self.view.endEditing(true)
        }).disposed(by: self.disposeBag)
    }
    
    private func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib(nibName: CharacterTableViewCell.id, bundle: nil), forCellReuseIdentifier: CharacterTableViewCell.id)
    }
    
    func refreshCharacters() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.tableFooterView?.removeFromSuperview()
        }
    }

}

// MARK: - Keyboard´s Events

extension CharacterSearchViewController {
    
    @objc override func keyboardWillAppear(_ notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3, animations: {
                self.tableViewBottomConstraint.constant = keyboardSize.height - self.view.safeAreaInsets.bottom
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @objc override func keyboardWillDisappear(_ notification: NSNotification) {
        if let _ = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.3) {
                self.tableViewBottomConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
}
