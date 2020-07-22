//
//  UIImageView+Extensions.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 21/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadRemoteImage(url: String?) {
        if let unwrapperUrl = url, let url = URL(string: unwrapperUrl) {
            let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .large)
            self.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            activityIndicator.center = self.center
            
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        activityIndicator.removeFromSuperview()
                        self?.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        activityIndicator.removeFromSuperview()
                        self?.image = UIImage(named: Constants.AssetImage.notFound)
                    }
                }
            }
        }
    }
    
}

