//
//  LoginViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 22/02/2024.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: Properties
    
    private let circle: UIView = {
        let circle = UIView()
        circle.backgroundColor = Colors.blue
        circle.layer.cornerRadius = 85 / 2
        circle.layer.masksToBounds = true
        
        return circle
    }()
    
    private let unionImage: UIImageView = {
        let union = UIImageView(image: .init(named: "Union"))
        
        return union
    }()
    
    private let background: UIView = {
        let back = UIView()
        back.backgroundColor = Colors.blue
        back.layer.cornerRadius = 8
        
        return back
    }()
    
    private let authLabel: UILabel = {
        let auth = UILabel()
        auth.textColor = .white
        auth.font = .systemFont(ofSize: 28, weight: .bold)
        auth.text = "Авторизация"
        
        return auth
    }()
    
    private let studNumberTextField: UITextField = {
        let studNumber = UITextField()
        studNumber.keyboardType = .decimalPad
        studNumber.returnKeyType = .go
        studNumber.layer.cornerRadius = 8
        studNumber.backgroundColor = .white
//        studNumber.delegate = self
        studNumber.textColor = .black
        studNumber.attributedPlaceholder = NSAttributedString(
            string: "Номер студенческого билета",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolder]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: studNumber.frame.height))
        studNumber.leftView = paddingView
        studNumber.leftViewMode = .always
        
        return studNumber
    }()
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.returnKeyType = .go
        password.layer.cornerRadius = 8
        password.backgroundColor = .white
        password.isSecureTextEntry = true
//        password.delegate = self
        password.textColor = .black
        password.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.placeHolder]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: password.frame.height))
        password.leftView = paddingView
        password.leftViewMode = .always
        
        return password
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor =  .white
        button.layer.cornerRadius = 8
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(Colors.blue, for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нет аккаунта? Зарегистрируйтесь", for: .normal)

        let attributedString = NSMutableAttributedString(string: "Нет аккаунта? Зарегистрируйтесь")
        let fullRange = NSRange(location: 0, length: attributedString.length)
        let rangeToUnderline = (attributedString.string as NSString).range(of: "Зарегистрируйтесь")

        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor.white, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: rangeToUnderline)

        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.blue
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        addSubviews()
        setUpConstraints()
    }
    
    private func setUp() {
        view.backgroundColor = .white
    }
    
    private func addSubviews() {
        view.addSubview(circle)
        circle.addSubview(unionImage)
        view.addSubview(background)
        
        background.addSubview(authLabel)
        background.addSubview(studNumberTextField)
        background.addSubview(passwordTextField)
        background.addSubview(loginButton)
        background.addSubview(registerButton)
    }
    
    private func setUpConstraints() {
        circle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(120)
            make.height.width.equalTo(85)
        }
        
        unionImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(19)
            make.width.equalTo(56)
            make.height.equalTo(45)
        }
        
        background.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(circle.snp.bottom).offset(33)
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview().inset(26)
            
        }
        
        authLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(26)
            make.height.equalTo(30)
        }
        
        studNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel).inset(65)
            make.height.equalTo(60)
            make.width.equalTo(280)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studNumberTextField).inset(85)
            make.height.equalTo(60)
            make.width.equalTo(280)
        }
        
        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(99)
            make.height.equalTo(49)
            make.width.equalTo(140)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(27)
        }
        
    }
    
    @objc private func loginTapped() {
        print("loginTapped")
    }
    
    @objc private func registerTapped() {
        print("registerTapped")
    }

}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
