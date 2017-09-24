//
//  LoginStyle.swift
//  Ripple_Exchange
//
//  Created by Jonathan Green on 9/24/17.
//  Copyright © 2017 ripple. All rights reserved.
//

import Foundation
import Cely

struct XrpStyle: CelyStyle {
    func backgroundColor() -> UIColor {
        return UIColor(red:0.99, green:0.99, blue:0.99, alpha:1.0) // Changing Color
    }
    func buttonTextColor() -> UIColor {
        return .white
    }
    func buttonBackgroundColor() -> UIColor {
        return UIColor(red: 86/255, green: 203/255, blue: 249/255, alpha: 1) // Changing Color
    }
    func textFieldBackgroundColor() -> UIColor {
        return UIColor.white.withAlphaComponent(0.4)
    }
    func appLogo() -> UIImage? {
        return UIImage(named: "xrp")
    }
}
