//
//  CustomPlaceholder.swift
//  RUTLead
//
//  Created by Michael Kivo on 22/03/2024.
//

import UIKit

class CustomPlaceholder: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        
        setUpLabel(text: text)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLabel(text: String) {
        self.text = text
        textColor = UIColor(named: "placeHolderAuth")
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
}
