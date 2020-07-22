//
//  BattleResultViewController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol BattleResultViewControllerProtocol: UIViewController { }

class BattleResultViewController: UIViewController, BattleResultViewControllerProtocol {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var goToRankingButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!

    private let disposeBag = DisposeBag()
    var presenter: BattleResultPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.localize()
        self.setUpView()
    }

    private func setUpView() {
        self.goToRankingButton.rx.tap.subscribe(onNext: {
            self.goToRankingView()
        }).disposed(by: self.disposeBag)
        
        self.closeButton.rx.tap.subscribe(onNext: {
            self.dismissView()
         }).disposed(by: self.disposeBag)
    }
    
    private func localize() {
        self.titleLabel.text = "battle_result_view_title_label".localized()
        self.goToRankingButton.setTitle("battle_result_view_go_to_ranking_button".localized(), for: .normal)
        self.winnerLabel.text = self.presenter?.getBattleResult()
    }

}
