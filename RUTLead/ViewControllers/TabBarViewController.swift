//
//  TabBarViewController.swift
//  RUTLead
//
//  Created by Michael Kivo on 29/02/2024.
//

import UIKit

final class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        generateTabBar()
        setUp()
    }
    
    private func setUp() {
        tabBar.backgroundColor = .white
        tabBar.barStyle = .default
        tabBar.tintColor = .none
        tabBar.layer.borderWidth = 2
        tabBar.layer.cornerRadius = Helpers.cornerRadius
        tabBar.layer.borderColor = Colors.placeHolder.cgColor
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(vc: JournalViewController(), image: UIImage(named: "journalOff"), selectedImage: "journalOn"),
            generateVC(vc: ProfileViewController(), image: UIImage(named: "profileOff"), selectedImage: "profileOn"),
        ]
    }
    
    private func generateVC(vc: UIViewController, image: UIImage?, selectedImage: String) -> UIViewController {
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: -20, right: 0)
        
        return vc
    }
}
