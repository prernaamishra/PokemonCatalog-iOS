//
//  Storyboarded.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//

import UIKit

protocol Storyboarded {
   static func instantiate(storyboard: UIStoryboard) -> Self
}

extension Storyboarded where Self: UIViewController {
   static func instantiate(storyboard: UIStoryboard) -> Self {
       let id = String(describing: self)
       return storyboard.instantiateViewController(identifier: id) as! Self
   }
}

