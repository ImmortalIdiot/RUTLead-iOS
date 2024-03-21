//
//  ResetPasswordViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 20/03/2024.
//

import UIKit
import SnapKit

final class ResetPasswordViewController: UIViewController {
    
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
        auth.text = "Сброс пароля"
        
        return auth
    }()
    
    private let emailTextField: CustomTextField = {
        let email = CustomTextField(placeHolder: "Электронная почта")
        email.keyboardType = .emailAddress
        
        return email
    }()
    
    private let passwordTextField: UITextField = {
        let password = CustomTextField(placeHolder: "Пароль")
        password.isSecureTextEntry = true
        
        let eye = UIButton(type: .custom)
        eye.setImage(.init(systemName: "eye.slash.fill"), for: .normal)
        eye.setImage(.init(systemName: "eye.fill"), for: .selected)
        eye.imageView?.tintColor = Colors.blueTabBar
        eye.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        eye.frame = CGRect(x: 0, y: 0, width: 45, height: 20)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 20))
        eye.center = view.center
        view.addSubview(eye)
        
        password.rightView = view
        password.rightViewMode = .always
        
        return password
    }()
    
    private let passwordAgainTextField: UITextField = {
        let password = CustomTextField(placeHolder: "Пароль повторно")
        password.isSecureTextEntry = true
        
        let eye = UIButton(type: .custom)
        eye.setImage(.init(systemName: "eye.slash.fill"), for: .normal)
        eye.setImage(.init(systemName: "eye.fill"), for: .selected)
        eye.imageView?.tintColor = Colors.blueTabBar
        eye.addTarget(self, action: #selector(eyeSecTapped), for: .touchUpInside)
        eye.frame = CGRect(x: 0, y: 0, width: 45, height: 20)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 20))
        eye.center = view.center
        view.addSubview(eye)
        
        password.rightView = view
        password.rightViewMode = .always
        
        return password
    }()
    
    private let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonAuth")
        button.layer.cornerRadius = Helpers.cornerRadius
        button.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        button.layer.borderWidth = 3
        button.setTitle("Сменить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(changeTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Есть аккаунт? Войдите", for: .normal)

        let attributedString = NSMutableAttributedString(string: "Есть аккаунт? Войдите")
        let fullRange = NSRange(location: 0, length: attributedString.length)
        let rangeToUnderline = (attributedString.string as NSString).range(of: "Войдите")

        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: fullRange)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "titleAuth")!, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: rangeToUnderline)

        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backAuth")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        addSubviews()
        setUpConstraints()
        setDelegates()
    }
    
    private func setUp() {
        view.backgroundColor = UIColor(named: "mainBackAuth")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tap)
    }
    
    private func setDelegates() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        passwordAgainTextField.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(titleImageView)
        titleImageView.addSubview(titleLabel)
        view.addSubview(background)
        
        background.addSubview(authLabel)
        
        [emailTextField, passwordTextField, passwordAgainTextField].forEach { content in
            background.addSubview(content)
        }
        
        [changeButton, loginButton].forEach { content in
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
            make.height.equalTo(479)
            make.leading.trailing.equalToSuperview().inset(26)
            
        }
        
        authLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(26)
            make.height.equalTo(30)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel).inset(65)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(85)
        }
        
        passwordAgainTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(85)
        }
        
        changeButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(passwordAgainTextField).inset(99)
            make.height.equalTo(55)
            make.width.equalTo(220)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(changeButton.snp.bottom).offset(12)
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
        emailTextField.backgroundColor = UIColor(named: "textFieldAuth")
        emailTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Номер студенческого билета",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        emailTextField.textColor = UIColor(named: "textFieldText")
        passwordTextField.textColor = UIColor(named: "textFieldText")
        passwordTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        passwordTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        passwordAgainTextField.textColor = UIColor(named: "textFieldText")
        passwordAgainTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordAgainTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        passwordAgainTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль повторно",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        changeButton.backgroundColor = UIColor(named: "buttonAuth")
        changeButton.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        loginButton.backgroundColor = UIColor(named: "backAuth")
    }
    
    @objc private func changeTapped() {
        // TODO: add reset pass logic
        print(#function)
    }
    
    @objc private func loginTapped() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       view.endEditing(true)
    }
    
    @objc private func eyeTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc private func eyeSecTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordAgainTextField.isSecureTextEntry.toggle()
    }
    
}

extension ResetPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

