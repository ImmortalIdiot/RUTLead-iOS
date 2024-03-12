//
//  ProfileViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 29/02/2024.
//

import UIKit
import SnapKit

final class ProfileViewController: UIViewController {

    // MARK: Properties
    
    private let mainTitle: UILabel = {
        let label = UILabel()
        label.text = "Профиль"
        label.textColor = Colors.placeHolder
        label.font = .systemFont(ofSize: 32, weight: .bold)
        
        return label
    }()
    
    private let background: UIView = {
        let back = UIView()
        back.backgroundColor = Colors.blueTabBar
        back.layer.cornerRadius = Helpers.cornerRadius
        
        return back
    }()
    
    private let signOutButton: UIButton = {
        let signOut = UIButton(type: .custom)
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 17, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "rectangle.portrait.and.arrow.forward", withConfiguration: largeConfig)
        
        signOut.setImage(largeBoldDoc, for: .normal)
        signOut.imageView?.tintColor = .white
        signOut.addTarget(self, action: #selector(signOutButtonTapped), for: .touchUpInside)
        
        return signOut
    }()
    
    private let userPhoto: UIImageView = {
        let image = UIImageView(image: .init(named: "User avatar"))
        
        return image
    }()
    
    private let userFIO: UILabel = {
        let fio = UILabel()
        fio.text = "Иванов Александр Дмитриевич"
        fio.font = .systemFont(ofSize: 17, weight: .bold)
        fio.textColor = .white
        fio.numberOfLines = 0
        
        return fio
    }()
    
    private let userGroup: UILabel = {
        let group = UILabel()
        group.text = "Студент группы УВП-212"
        group.font = .systemFont(ofSize: 13, weight: .bold)
        group.textColor = .white
        
        return group
    }()
    
    private let autoThemeButton: UIButton = {
        let auto = UIButton(type: .custom)
        auto.backgroundColor = Colors.blueTabBar
        auto.tag = 0
        auto.layer.cornerRadius = 18
        auto.setTitle("Авто", for: .normal)
        auto.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        auto.setTitleColor(.white, for: .normal)
//        auto.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        auto.addTarget(self, action: #selector(autoThemeButtonTapped), for: .touchUpInside)
        
        return auto
    }()
    
    private let lightThemeButton: UIButton = {
        let light = UIButton(type: .custom)
        light.tag = 1
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "sun.max.fill", withConfiguration: largeConfig)
        
//        light.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        light.layer.cornerRadius = 18
        light.setImage(largeBoldDoc, for: .normal)
        light.addTarget(self, action: #selector(lightThemeButtonTapped), for: .touchUpInside)
        light.imageView?.tintColor = .white
                
        return light
    }()
    
    private let darkThemeButton: UIButton = {
        let dark = UIButton(type: .custom)
        dark.tag = 2
        
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .bold, scale: .large)
        let largeBoldDoc = UIImage(systemName: "moon.fill", withConfiguration: largeConfig)
        
        dark.layer.cornerRadius = 18
//        dark.frame = CGRect(x: 0, y: 0, width: 80, height: 50)
        dark.setImage(largeBoldDoc, for: .normal)
        dark.imageView?.tintColor = .white
        dark.addTarget(self, action: #selector(darkThemeButtonTapped), for: .touchUpInside)
        
        return dark
    }()
    
    private var stackViewButtons: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 30
        stackView.layer.cornerRadius = Helpers.cornerRadius
        stackView.layer.borderColor = UIColor.white.cgColor
        stackView.layer.borderWidth = 3
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let changeGroupButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = Helpers.cornerRadius
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = Colors.blueTabBar.cgColor
        button.setTitle("Изменить группу", for: .normal)
        button.setTitleColor(Colors.blueTabBar, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(changeGroupButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let deleteAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = Helpers.cornerRadius
        button.backgroundColor = .white
        button.layer.borderWidth = 2
        button.layer.borderColor = Colors.red.cgColor
        button.setTitle("Удалить аккаунт", for: .normal)
        button.setTitleColor(Colors.red, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
        
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
        view.addSubview(mainTitle)
        view.addSubview(background)
        view.addSubview(changeGroupButton)
        view.addSubview(deleteAccountButton)
        
        background.addSubview(signOutButton)
        
        [userPhoto, userFIO, userGroup].forEach { maker in
            background.addSubview(maker)
        }
        
        background.addSubview(stackViewButtons)
        stackViewButtons.addArrangedSubview(autoThemeButton)
        stackViewButtons.addArrangedSubview(lightThemeButton)
        stackViewButtons.addArrangedSubview(darkThemeButton)
    }
    
    private func setUpConstraints() {
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            make.leading.equalToSuperview().offset(24)
        }
        
        background.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalTo(mainTitle.snp.bottom).offset(40)
            make.height.equalTo(313)
        }
        
        userPhoto.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
            make.width.height.equalTo(86)
        }
        
        userFIO.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userPhoto.snp.bottom).offset(15)
        }
        
        userGroup.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(userFIO.snp.bottom).offset(10)
        }
        
        changeGroupButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalTo(background.snp.bottom).offset(20)
            make.height.equalTo(55)
        }
        
        deleteAccountButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(19)
            make.top.equalTo(changeGroupButton.snp.bottom).offset(20)
            make.height.equalTo(55)
        }
        
        signOutButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(19)
            make.top.equalToSuperview().offset(15)
        }
        
        stackViewButtons.snp.makeConstraints { make in
            make.top.equalTo(userGroup.snp.bottom).offset(38)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalTo(270)
        }
    }
    
    private func toggleButton(_ button: UIButton) {
        if button.backgroundColor == UIColor.white {
            deselectButton(button)
        } else if button.backgroundColor == Colors.blueTabBar {
            selectButton(button)
        }
    }
    
    private func selectButton(_ button: UIButton) {
        button.imageView?.tintColor = Colors.blueTabBar
        button.setTitleColor(Colors.blueTabBar, for: .normal)
        button.backgroundColor = .white
    }
    
    private func deselectButton(_ button: UIButton) {
        button.imageView?.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.blueTabBar
    }
    
    private func getThemeButtons() -> [UIButton] {
        return [autoThemeButton, lightThemeButton, darkThemeButton]
    }
    
    @objc private func changeGroupButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Подтверждение", message: "Введите название новой группы", preferredStyle: .alert)
        alert.addTextField()
        alert.textFields?.first?.placeholder = "УВП-212"
        
        let dismissAction = UIAlertAction(title: "Отмена", style: .default) { result in
            return
        }
        
        let saveAction = UIAlertAction(title: "Сохранить", style: .cancel) { result in
            // TODO: Change group
            
            let text = alert.textFields?.first?.text
            if text != "" {
                print(text ?? "nil")
            }
        }
        
        alert.addAction(dismissAction)
        alert.addAction(saveAction)
        present(alert, animated: true)
    }
    
    @objc private func deleteAccountButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Подтверждение", message: "Вы уверены, что хотите удалить аккаунт?", preferredStyle: .alert)
        
        let dismissAction = UIAlertAction(title: "Отмена", style: .cancel) { result in
            return
        }
        
        let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { result in
            // TODO: Delete account
        }
        
        alert.addAction(dismissAction)
        alert.addAction(deleteAction)
        present(alert, animated: true)
    }
    
    @objc private func autoThemeButtonTapped(_ sender: UIButton) {
        let array = getThemeButtons()
        
        toggleButton(sender)
        
        for but in array {
            if but.tag != sender.tag {
                deselectButton(but)
            }
        }
    }
    
    @objc private func lightThemeButtonTapped(_ sender: UIButton) {
        autoThemeButtonTapped(sender)
    }
    
    @objc private func darkThemeButtonTapped(_ sender: UIButton) {
        autoThemeButtonTapped(sender)
    }
    
    @objc private func signOutButtonTapped(_ sender: UIButton) {
        let alert = UIAlertController(title: "Подтверждение", message: "Вы уверены, что хотите выйти?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Да", style: .destructive) { result in
            print("yes")
            
            // TODO: Sign out
        }
        
        let noAction = UIAlertAction(title: "Нет", style: .cancel) { result in
            return
        }
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        present(alert, animated: true)
    }

}
