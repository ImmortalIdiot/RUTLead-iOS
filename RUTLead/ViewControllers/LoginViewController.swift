//
//  LoginViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 22/02/2024.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
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
        auth.text = "Авторизация"
        
        return auth
    }()
    
    private let studNumberTextField: CustomTextField = {
        let studNumber = CustomTextField(placeHolder: "Номер студенческого билета")
        studNumber.keyboardType = .decimalPad
        
        return studNumber
    }()
    
    private let passwordTextField: CustomTextField = {
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

    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonAuth")
        button.layer.cornerRadius = Helpers.cornerRadius
        button.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        button.layer.borderWidth = 3
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нет аккаунта? Зарегистрируйтесь", for: .normal)

        let attributedString = NSMutableAttributedString(string: "Нет аккаунта? Зарегистрируйтесь")
        let fullRange = NSRange(location: 0, length: attributedString.length)
        let rangeToUnderline = (attributedString.string as NSString).range(of: "Зарегистрируйтесь")

        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16), range: fullRange)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "titleAuth"), range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: rangeToUnderline)

        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backAuth")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let forgotPassButton: UIButton = {
        let button = UIButton(type: .system)
        
        let attributedString = NSMutableAttributedString(string: "Забыли пароль?")
        let rangeToUnderline = (attributedString.string as NSString).range(of: "Забыли пароль?")
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "titleAuth"), range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16, weight: .bold), range: rangeToUnderline)
        
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backAuth")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(forgotPassTapped), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Methods
    
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
    
    private func addSubviews() {
        view.addSubview(titleImageView)
        titleImageView.addSubview(titleLabel)
        view.addSubview(background)
        
        background.addSubview(authLabel)
        
        [studNumberTextField, passwordTextField].forEach { content in
            background.addSubview(content)
        }
        
        [registerButton, loginButton, forgotPassButton].forEach { content in
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
            make.top.equalTo(titleImageView.snp.bottom).offset(45)
            make.height.equalTo(430)
            make.leading.trailing.equalToSuperview().inset(26)
            
        }
        
        authLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
            make.height.equalTo(30)
        }
        
        studNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel).offset(65)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studNumberTextField).offset(85)
        }
        
        loginButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(passwordTextField).offset(90)
            make.height.equalTo(55)
            make.width.equalTo(180)
        }
        
        registerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loginButton.snp.bottom).offset(20)
        }
        
        forgotPassButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(5)
        }
        
    }
    
    private func setDelegates() {
        studNumberTextField.delegate = self
        passwordTextField.delegate = self
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
        studNumberTextField.textColor = UIColor(named: "textFieldText")
        passwordTextField.textColor = UIColor(named: "textFieldText")
        passwordTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        passwordTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        loginButton.backgroundColor = UIColor(named: "buttonAuth")
        loginButton.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        registerButton.backgroundColor = UIColor(named: "backAuth")
    }
    
    @objc private func loginTapped() {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
    @objc private func registerTapped() {
        navigationController?.pushViewController(RegisterViewController(), animated: true)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       view.endEditing(true)
    }
    
    @objc private func forgotPassTapped() {
        navigationController?.pushViewController(ResetPasswordViewController(), animated: true)
    }
    
    @objc private func eyeTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
