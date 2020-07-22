//
//  BattleResultViewController+Router.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 22/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension BattleResultViewController {
    
    func goToRankingView() {
        DispatchQueue.main.async {
            if let parentVC = self.presentingViewController as? BottomMenuTabController {
                parentVC.setRootRankingView()
            }
        }
    }
    
    func dismissView() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
