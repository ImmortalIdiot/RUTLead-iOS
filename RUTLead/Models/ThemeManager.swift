//
//  ThemeManager.swift
//  RUTLead
//
//  Created by Michael Kivo on 11/03/2024.
//

import UIKit

enum Theme {
    case light
    case dark
    
    var backgroundColor: UIColor {
        switch self {
        case .light:
            return .white
        case .dark:
            return .black
        }
    }
}

class ThemeManager {
    static let shared = ThemeManager()
    
    var currentTheme: Theme = .light {
        didSet {
            applyTheme()
        }
    }
    
    private init() {}
    
    func applyTheme() {
        UIApplication.shared.windows.forEach { window in
            window.backgroundColor = currentTheme.backgroundColor
        }
    }
}
