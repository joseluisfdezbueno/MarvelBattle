//
//  UIColor+Extensions.swift
//  MarvelBattle
//
//  Created by Jose Luis Fernandez on 18/07/2020.
//  Copyright © 2020 joseluisfernandezbueno. All rights reserved.
//

import UIKit

enum AssetsColor: String {
    case primaryColor
    case textColor
}

extension UIColor {

    static func appColor(_ name: AssetsColor) -> UIColor {
        return UIColor(named: name.rawValue) ?? UIColor.black // Black For Testing
    }

}
