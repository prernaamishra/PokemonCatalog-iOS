//
//  classNameProtocol.swift
//  PokemonCatalog
//
//  Created by Prerna Mishra on 10/20/20.
//  Copyright © 2020 Prerna Mishra. All rights reserved.
//


import Foundation

protocol ClassNameProtocol {
    static var className: String { get } // for accesing without object
    var className: String { get }  // from an object of tht class
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}

