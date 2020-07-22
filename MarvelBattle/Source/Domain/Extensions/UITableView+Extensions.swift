//
//  UITableView+Extensions.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 21/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension UITableView {
    
    func showSpinnerLoading() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: 44)
        spinner.startAnimating()
        self.tableFooterView = spinner
        self.tableFooterView?.isHidden = false
    }
    
}
