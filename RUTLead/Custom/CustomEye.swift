//
//  CustomEye.swift
//  RUTLead
//
//  Created by Michael Kivo on 24/03/2024.
//

import UIKit

class CustomEye: UIButton {
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setUpEye()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpEye() {
        setImage(.init(systemName: "eye.slash.fill"), for: .normal)
        setImage(.init(systemName: "eye.fill"), for: .selected)
        imageView?.tintColor = Colors.blueTabBar
        frame = CGRect(x: 0, y: 0, width: 45, height: 20)
    }
}
