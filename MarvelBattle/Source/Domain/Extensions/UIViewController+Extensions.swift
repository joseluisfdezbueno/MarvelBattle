//
//  UIViewController+Extensions.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 16/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillAppear(_ notification: NSNotification) {
        // not implemented
    }
    
    @objc func keyboardWillDisappear(_ notification: NSNotification) {
        // not implemented
    }
    
    func applyDefaultNavigationBarStyle() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.appColor(.primaryColor)

        self.navigationController?.navigationBar.standardAppearance = navBarAppearance
        self.navigationController?.navigationBar.compactAppearance = navBarAppearance
        self.navigationController?.navigationBar.tintColor = UIColor.white
    }
    
    func showDefaultAlert() {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "default_error_alert_title".localized(), message: "default_error_alert_message".localized(), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "accept".localized(), style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
        
}
