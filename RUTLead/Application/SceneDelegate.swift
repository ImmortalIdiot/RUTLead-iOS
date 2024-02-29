//
//  SceneDelegate.swift
//  RUTLead
//
//  Created by Michael Kivo on 22/02/2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        let vc = LoginViewController()
        let navController = UINavigationController(rootViewController: vc)
        navController.setNavigationBarHidden(true, animated: false)
        
        window.rootViewController = navController
        
        self.window = window
        self.window?.makeKeyAndVisible()

    }
    
}

