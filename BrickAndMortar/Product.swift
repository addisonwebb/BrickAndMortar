//
//  Product.swift
//  BrickAndMortar
//
//  Created by Addison Webb on 7/28/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import Foundation

public class Product {
    let identity: String
    let name: String
    
    public init(with identity: String, name: String) {
        self.identity = identity
        self.name = name
    }
}
