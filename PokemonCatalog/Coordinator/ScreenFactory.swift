//
//  ScreenFactory.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//


import UIKit

enum Screen {
    case home
}

extension Screen {
    func createViewController() -> UIViewController {
        switch self {
        case .home:
            var homeVC = HomeViewController.instantiate(storyboard: .main)
            // pass network service to VM, helps in testing with Mock service
            let pokemonService = PokemonAPIClient()
            let homeVM = HomeViewModel(service: pokemonService)
            homeVC.bindVM(to: homeVM)
            return homeVC
        }
    }
}
