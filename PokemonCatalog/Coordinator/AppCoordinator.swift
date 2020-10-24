//
//  AppCoordinator.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//



import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var rootViewController: UINavigationController
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        setupNavBarUI()
    }
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
    
    func setupNavBarUI() {
        
        let navBar = rootViewController.navigationBar
        navBar.isTranslucent = true
        navBar.prefersLargeTitles = true
        let navBarAppearance = UINavigationBarAppearance()
        let titleColor = UITraitCollection.current.userInterfaceStyle == .dark ? UIColor.white : UIColor.black
        navBarAppearance.titleTextAttributes = [.foregroundColor:  titleColor ]
        navBar.standardAppearance = navBarAppearance
    }
    
    func transition(to screen: Screen, type: ScreenTransitionType) {
        transition(to: screen.createViewController(), type: type)
    }
    
    func transition(to viewController: UIViewController, type: ScreenTransitionType) {
        switch type {
        case .root:
            if rootViewController.presentingViewController != nil {
                rootViewController.dismiss(animated: true)
            } else {
                rootViewController.pushViewController(viewController, animated: true)
            }
        case .modal:
            rootViewController.present(viewController, animated: true)
        case .push:
            rootViewController.pushViewController(viewController, animated: true)
        case .popup:
            rootViewController.present(viewController, animated: true, completion: nil)
        }
    }
    
    
}

