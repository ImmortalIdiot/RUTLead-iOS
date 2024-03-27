//
//  CustomEnterButton.swift
//  RUTLead
//
//  Created by Michael Kivo on 24/03/2024.
//

import UIKit

class CustomEnterButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        
        setUpButton(title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton(_ title: String) {
        backgroundColor = UIColor(named: "buttonAuth")
        layer.cornerRadius = Helpers.cornerRadius
        layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        layer.borderWidth = 3
        setTitle(title, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        setTitleColor(.white, for: .normal)
    }
}
