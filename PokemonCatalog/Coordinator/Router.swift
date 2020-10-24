//
//  Router.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//


import UIKit

class Router {
    static let shared = Router()
    private var coordinator: AppCoordinator!
    private var navigationController: UINavigationController {
        return coordinator.rootViewController
    }
    
    private init() {}
    
    func setWindow(window: UIWindow) {
        coordinator = AppCoordinator(window: window)
        coordinator.start()
    }
    
    // MARK: Navigation helpers
    var currentViewController: UIViewController? {
        return navigationController.topViewController
    }
    
    func showHomeScreen() {
        coordinator.transition(to: .home, type: .root)
    }
    
    func presentPopup(_ alertController: UIAlertController) {
        coordinator.transition(to: alertController, type: .popup)
    }
    
}


