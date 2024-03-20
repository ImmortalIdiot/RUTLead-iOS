//
//  SecondRegisterViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 18/03/2024.
//

import UIKit
import SnapKit

final class SecondRegisterViewController: UIViewController {
    
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
        auth.text = "Регистрация"
        
        return auth
    }()
    
    private let fioTextField: UITextField = {
        let studNumber = UITextField()
        studNumber.keyboardType = .default
        studNumber.returnKeyType = .go
        studNumber.layer.cornerRadius = Helpers.cornerRadius
        studNumber.textColor = .white
        studNumber.backgroundColor = UIColor(named: "textFieldAuth")
        studNumber.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        studNumber.layer.borderWidth = 3
        studNumber.attributedPlaceholder = NSAttributedString(
            string: "ФИО",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: studNumber.frame.height))
        studNumber.leftView = paddingView
        studNumber.leftViewMode = .always
        
        return studNumber
    }()
    
    private let groupTextField: UITextField = {
        let password = UITextField()
        password.returnKeyType = .go
        password.layer.cornerRadius = Helpers.cornerRadius
        password.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        password.layer.borderWidth = 3
        password.backgroundColor = UIColor(named: "textFieldAuth")
        password.textColor = .white
        password.attributedPlaceholder = NSAttributedString(
            string: "Группа (УВП-212)",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 11, height: password.frame.height))
        password.leftView = paddingView
        password.leftViewMode = .always
        
        return password
    }()

    private let enterButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "buttonAuth")
        button.layer.cornerRadius = Helpers.cornerRadius
        button.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        button.layer.borderWidth = 3
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23, weight: .bold)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(enterTapped), for: .touchUpInside)
        
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
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: UIColor(named: "titleAuth"), range: rangeToUnderline)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: 16), range: rangeToUnderline)

        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "backAuth")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        
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
        
        [fioTextField, groupTextField].forEach { content in
            background.addSubview(content)
        }
        
        [enterButton, loginButton].forEach { content in
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
            make.height.equalTo(400)
            make.leading.trailing.equalToSuperview().inset(26)
            
        }
        
        authLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(32)
            make.height.equalTo(30)
        }
        
        fioTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel).offset(65)
            make.height.equalTo(60)
            make.width.equalTo(280)
        }
        
        groupTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fioTextField).offset(85)
            make.height.equalTo(60)
            make.width.equalTo(280)
        }
        
        enterButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(groupTextField).offset(90)
            make.height.equalTo(55)
            make.width.equalTo(180)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(enterButton.snp.bottom).offset(20)
        }
        
    }
    
    private func setDelegates() {
        fioTextField.delegate = self
        groupTextField.delegate = self
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
        fioTextField.backgroundColor = UIColor(named: "textFieldAuth")
        fioTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        fioTextField.attributedPlaceholder = NSAttributedString(
            string: "Номер студенческого билета",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        groupTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        groupTextField.backgroundColor = UIColor(named: "textFieldAuth")
        groupTextField.attributedPlaceholder = NSAttributedString(
            string: "Пароль",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeHolderAuth")]
        )
        enterButton.backgroundColor = UIColor(named: "buttonAuth")
        enterButton.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        loginButton.backgroundColor = UIColor(named: "backAuth")
    }
    
    @objc private func loginTapped() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    @objc private func enterTapped() {
        navigationController?.pushViewController(TabBarViewController(), animated: true)
    }
    
    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       view.endEditing(true)
    }
    
}

extension SecondRegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}