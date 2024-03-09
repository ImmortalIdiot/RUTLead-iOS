//
//  Helpers.swift
//  RUTLead
//
//  Created by Michael Kivo on 28/02/2024.
//

import UIKit

struct Helpers {
    static let cornerRadius: CGFloat = 14
    
    static let title: String = "РУТлид"
    
    static func isLightTheme() -> Bool {
        if UITraitCollection.current.userInterfaceStyle == .light {
            return true
        }
        return false
    }
}
