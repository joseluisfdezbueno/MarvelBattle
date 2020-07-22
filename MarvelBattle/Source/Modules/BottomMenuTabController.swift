//
//  BottomMenuTabController.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 15/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

class BottomMenuTabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
    }

    private func setUpView() {
        self.tabBar.barTintColor = UIColor.appColor(.primaryColor)
        self.tabBar.tintColor = UIColor.yellow
        self.tabBar.unselectedItemTintColor = UIColor.white
        self.initTabs()
    }
    
    private func initTabs() {
        let characterSearchVC = DefaultViewFactory.shared.getCharacterSearchView()
        let arenaVC = DefaultViewFactory.shared.getArenaView()
        let rankingVC = DefaultViewFactory.shared.getRankingView()
        let controllers = [characterSearchVC, arenaVC, rankingVC]

        characterSearchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        characterSearchVC.tabBarItem.setValue("search_view_title".localized(), forKey: "internalTitle")
        arenaVC.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        arenaVC.tabBarItem.setValue("arena_view_title".localized(), forKey: "internalTitle")
        rankingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 2)
        rankingVC.tabBarItem.setValue("ranking_view_title".localized(), forKey: "internalTitle")

        self.viewControllers = controllers.map { UINavigationController(rootViewController: $0) }
    }
    
}

// MARK: - Router

extension BottomMenuTabController {
    
    func setRootRankingView() {
        if let presentedVC = self.presentedViewController {
            presentedVC.dismiss(animated: true) {
                self.selectedIndex = 2
            }
        } else {
            self.selectedIndex = 2
        }
    }
    
}
