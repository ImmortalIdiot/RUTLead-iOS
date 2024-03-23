//
//  CustomTextField.swift
//  RUTLead
//
//  Created by Michael Kivo on 21/03/2024.
//

import UIKit

final class CustomTextField: UITextField {
    
    private let padding = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 0)
    
    init(placeHolder: String) {
        super.init(frame: .zero)
        
        setUpTextField(placeHolder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpTextField(_ placeHolder: String?) {
        returnKeyType = .go
        layer.cornerRadius = Helpers.cornerRadius
        textColor = UIColor(named: "textFieldText")
        backgroundColor = UIColor(named: "textFieldAuth")
        layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        layer.borderWidth = 3
        
        if let placeHolder = placeHolder {
            attributedPlaceholder = NSAttributedString(
                string: placeHolder,
                attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")!]
            )
        }
        
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
