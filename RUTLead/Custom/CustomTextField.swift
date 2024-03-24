//
//  CustomTextField.swift
//  RUTLead
//
//  Created by Michael Kivo on 21/03/2024.
//

import UIKit

final class CustomTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
    
    init(boardType: UIKeyboardType = .default, tag: Int, isSecure: Bool = false) {
        super.init(frame: .zero)
        
        setUpTextField(boardType, tag: tag, isSecure: isSecure)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTextField(_ boardType: UIKeyboardType, tag: Int, isSecure: Bool) {
        self.tag = tag
        isSecureTextEntry = isSecure
        keyboardType = boardType
        returnKeyType = .go
        layer.cornerRadius = Helpers.cornerRadius
        textColor = UIColor(named: "textFieldText")
        backgroundColor = UIColor(named: "textFieldAuth")
        layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        layer.borderWidth = 3
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        widthAnchor.constraint(equalToConstant: 280).isActive = true
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
}
