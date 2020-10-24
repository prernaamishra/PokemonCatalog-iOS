//
//  Coordinator.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//

import UIKit
  
protocol Coordinator {
    
    var rootViewController: UINavigationController { get set }
    func start()
    
}

