//
//  RegisterViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 26/02/2024.
//

import UIKit
import SnapKit

final class RegisterViewController: UIViewController {
    
    // MARK: Properties
    
    private let titleImageView: UIImageView = {
        let image = UIImageView()
        
        if Helpers.isLightTheme() {
            image.image = .light
        } else {
            image.image = .dark
        }
        
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Helpers.title
        label.backgroundColor = .clear
        label.textColor = UIColor(named: "RUTLead")
        label.font = .systemFont(ofSize: 27, weight: .bold)
        
        return label
    }()
    
    private let background: UIView = {
        let back = UIView()
        back.backgroundColor = UIColor(named: "backAuth")
        back.layer.cornerRadius = Helpers.cornerRadius
        back.layer.borderWidth = 3
        back.layer.borderColor = UIColor(named: "backBorderAuth")?.cgColor
        
        return back
    }()
    
    private let authLabel: UILabel = {
        let auth = UILabel()
        auth.textColor = UIColor(named: "titleAuth")
        auth.font = .systemFont(ofSize: 28, weight: .bold)
        auth.text = "Регистрация"
        
        return auth
    }()
    
    private let studNumberTextField: UITextField = {
        let studNumber = UITextField()
        studNumber.keyboardType = .decimalPad
        studNumber.returnKeyType = .go
        studNumber.layer.cornerRadius = Helpers.cornerRadius
//        studNumber.delegate = self
        studNumber.textColor = .black
        studNumber.backgroundColor = UIColor(named: "textFieldAuth")
        studNumber.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        studNumber.layer.borderWidth = 3
        studNumber.attributedPlaceholder = NSAttributedString(
            string: "Номер студенческого билета",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: studNumber.frame.height))
        studNumber.leftView = paddingView
        studNumber.leftViewMode = .always
        
        return studNumber
    }()
    
    private let passwordTextField: UITextField = {
        let password = UITextField()
        password.returnKeyType = .go
        password.layer.cornerRadius = Helpers.cornerRadius
        password.isSecureTextEntry = true
        password.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        password.layer.borderWidth = 3
        password.backgroundColor = UIColor(named: "textFieldAuth")
//        password.delegate = self
        password.textColor = .black
        password.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: password.frame.height))
        password.leftView = paddingView
        password.leftViewMode = .always
        
        return password
    }()
    
    private let passwordTwoTextField: UITextField = {
        let password = UITextField()
        password.returnKeyType = .go
        password.backgroundColor = UIColor(named: "textFieldAuth")
        password.layer.cornerRadius = Helpers.cornerRadius
        password.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        password.layer.borderWidth = 3
        password.isSecureTextEntry = true
//        password.delegate = self
        password.textColor = .black
        password.attributedPlaceholder = NSAttributedString(
            string: "Пароль повторно",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: password.frame.height))
        password.leftView = paddingView
        password.leftViewMode = .always
        
        return password
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonAuth")
        button.layer.cornerRadius = Helpers.cornerRadius
        button.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        button.layer.borderWidth = 3
        button.setTitle("Регистрация", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Есть аккаунт? Войдите", for: .normal)

        let attributedString = NSMutableAttributedString(string: "Есть аккаунт? Войдите")
        let fullRange = NSRange(location: 0, length: attributedString.length)
        let rangeToUnderline = (attributedString.string as NSString).range(of: "Войдите")

        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14), range: fullRange)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "titleAuth"), range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 14), range: rangeToUnderline)

        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backAuth")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
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
        view.backgroundColor = UIColor(named: "mainBackAuth")
    }
    
    private func addSubviews() {
        view.addSubview(titleImageView)
        titleImageView.addSubview(titleLabel)
        view.addSubview(background)
        
        background.addSubview(authLabel)
        
        [studNumberTextField, passwordTextField, passwordTwoTextField].forEach { content in
            background.addSubview(content)
        }
        
        [registerButton, loginButton].forEach { content in
            background.addSubview(content)
        }
    }
    
    private func setUpConstraints() {
        titleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(107)
            make.centerX.equalToSuperview()
            make.height.equalTo(60)
            make.width.equalTo(170)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
            make.width.equalTo(110)
        }
        
        background.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleImageView.snp.bottom).offset(50)
            make.height.equalTo(465)
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
        
        passwordTwoTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(85)
            make.height.equalTo(60)
            make.width.equalTo(280)
        }
        
        registerButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(passwordTwoTextField).inset(99)
            make.height.equalTo(49)
            make.width.equalTo(200)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(18)
        }
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        updateTheme()
    }
    
    private func updateTheme() {
        print("Phone theme has changed.")
        let isLightTheme = Helpers.isLightTheme()

        titleImageView.image = isLightTheme ? .light : .dark
        titleLabel.textColor = UIColor(named: "RUTLead")
        background.backgroundColor = UIColor(named: "backAuth")
        background.layer.borderColor = UIColor(named: "backBorderAuth")?.cgColor
        authLabel.textColor = UIColor(named: "titleAuth")
        studNumberTextField.backgroundColor = UIColor(named: "textFieldAuth")
        studNumberTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        studNumberTextField.attributedPlaceholder = NSAttributedString(
            string: "Номер студенческого билета",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        passwordTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        passwordTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        passwordTwoTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTwoTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        passwordTwoTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль повторно",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        registerButton.backgroundColor = UIColor(named: "buttonAuth")
        registerButton.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        loginButton.backgroundColor = UIColor(named: "backAuth")
    }
    
    @objc private func registerTapped() {
        print("registerTapped")
    }
    
    @objc private func loginTapped() {
        print("loginTapped")
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}