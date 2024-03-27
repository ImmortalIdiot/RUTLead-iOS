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
        view.backgroundColor = .white
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = Colors.blueTabBar
        tabBar.layer.borderWidth = 2
        tabBar.layer.cornerRadius = Helpers.cornerRadius
        tabBar.layer.borderColor = Colors.placeHolder.cgColor
        tabBar.unselectedItemTintColor = Colors.placeHolder
        
        tabBar.items?.forEach({ item in
            item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 10)
        })
        
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(vc: JournalViewController(), image: "tab", title: "Журнал"),
            generateVC(vc: ProfileViewController(), image:  "prof", title: "Профиль")
        ]
    }
    
    private func generateVC(vc: UIViewController, image: String, title: String) -> UIViewController {
        vc.tabBarItem.image = UIImage(named: image)
        vc.title = title
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 20, left: 0, bottom: 5, right: 0)
        
        return vc
    }
}
