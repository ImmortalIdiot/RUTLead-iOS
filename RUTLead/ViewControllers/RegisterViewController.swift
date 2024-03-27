//
//  RegisterViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 26/02/2024.
//

import UIKit
import SnapKit

final class RegisterViewController: UIViewController {
    
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
    
    private let studNumberTextField: UITextField = {
        CustomTextField(boardType: .decimalPad, tag: 0)
    }()
    
    private let studPlaceholder: CustomPlaceholder = {
        CustomPlaceholder(text: "Номер студенческого билета")
    }()
    
    private let emailTextField: CustomTextField = {
        CustomTextField(boardType: .emailAddress, tag: 1)
    }()
    
    private let emailPlaceholder: CustomPlaceholder = {
        CustomPlaceholder(text: "Электронная почта")
    }()
    
    private let passwordTextField: CustomTextField = {
        let password = CustomTextField(tag: 2, isSecure: true)
        
        let eye = CustomEye()
        eye.addTarget(self, action: #selector(eyeTapped), for: .touchUpInside)
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 46, height: 20))
        eye.center = view.center
        view.addSubview(eye)
        
        password.rightView = view
        password.rightViewMode = .always
        
        return password
    }()
    
    private let passPlaceholder: CustomPlaceholder = {
        CustomPlaceholder(text: "Пароль")
    }()
    
    private let registerButton: UIButton = {
        let button = CustomEnterButton(title: "Далее")
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        
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
    
    private func setDelegates() {
        studNumberTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    private func addSubviews() {
        view.addSubview(titleImageView)
        titleImageView.addSubview(titleLabel)
        view.addSubview(background)
        
        background.addSubview(authLabel)
        
        [studNumberTextField, emailTextField, passwordTextField].forEach { content in
            background.addSubview(content)
        }
        
        [registerButton, loginButton].forEach { content in
            background.addSubview(content)
        }
        
        studNumberTextField.addSubview(studPlaceholder)
        emailTextField.addSubview(emailPlaceholder)
        passwordTextField.addSubview(passPlaceholder)
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
        
        studNumberTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(authLabel).inset(65)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(studNumberTextField).inset(85)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(85)
        }
        
        registerButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.top.equalTo(passwordTextField).inset(99)
            make.height.equalTo(55)
            make.width.equalTo(220)
        }
        
        loginButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(registerButton.snp.bottom).offset(12)
        }
        
        studPlaceholder.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-108)
            make.centerY.equalToSuperview().offset(-10)
        }
        
        emailPlaceholder.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-68)
            make.centerY.equalToSuperview().offset(-10)
        }
        
        passPlaceholder.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(-19)
            make.centerY.equalToSuperview().offset(-10)
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
        studNumberTextField.textColor = UIColor(named: "textFieldText")
        emailTextField.textColor = UIColor(named: "textFieldText")
        emailTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        emailTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTextField.textColor = UIColor(named: "textFieldText")
        passwordTextField.backgroundColor = UIColor(named: "textFieldAuth")
        passwordTextField.layer.borderColor = UIColor(named: "textFieldBorderAuth")?.cgColor
        registerButton.backgroundColor = UIColor(named: "buttonAuth")
        registerButton.layer.borderColor = UIColor(named: "buttonBorderAuth")?.cgColor
        loginButton.backgroundColor = UIColor(named: "backAuth")
    }
    
    @objc private func registerTapped() {
        navigationController?.pushViewController(SecondRegisterViewController(), animated: true)
    }
    
    @objc private func loginTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
       view.endEditing(true)
    }
    
    @objc private func eyeTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    private func startAnimate(placeholder: UILabel, tf: UITextField, forNum: Int) {
        placeholder.transform = CGAffineTransform(scaleX: 0.6, y: 0.6)
        placeholder.snp.updateConstraints { make in
            make.leading.equalTo(tf).offset(forNum)
            make.centerY.equalTo(tf).offset(-23)
        }
        self.view.layoutIfNeeded()
    }
    
    private func stopAnimate(placeholder: UILabel, tf: UITextField, forNum: Int) {
        placeholder.transform = .identity
        placeholder.snp.updateConstraints { make in
            make.leading.equalTo(tf).offset(forNum)
            make.centerY.equalTo(tf).offset(-10)
        }
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            if textField.tag == 0 {
                self.startAnimate(placeholder: self.studPlaceholder, tf: self.studNumberTextField, forNum: -106)
            } else if textField.tag == 1 {
                self.startAnimate(placeholder: self.emailPlaceholder, tf: self.emailTextField, forNum: -65)
            } else if textField.tag == 2 {
                self.startAnimate(placeholder: self.passPlaceholder, tf: self.passwordTextField, forNum: -18)
            }
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.1) {
            if textField.tag == 0 && !self.studNumberTextField.hasText {
                self.stopAnimate(placeholder: self.studPlaceholder, tf: self.studNumberTextField, forNum: -107)
            } else if textField.tag == 1 && !self.emailTextField.hasText {
                self.stopAnimate(placeholder: self.emailPlaceholder, tf: self.emailTextField, forNum: -68)
            } else if textField.tag == 2 && !self.passwordTextField.hasText {
                self.stopAnimate(placeholder: self.passPlaceholder, tf: self.passwordTextField, forNum: -19)
            }
        }
    }
    
}
