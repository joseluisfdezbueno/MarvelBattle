//
//  String+Extension.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 18/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

extension String {
    
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
}
