//
//  ViewController.swift
//  Demo
//
//  Created by Addison Webb on 7/26/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import UIKit
import BrickAndMortar

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonAction(_ sender: Any) {
        
        let products = [
            Product(with: "", name: "TP 1"),
            Product(with: "", name: "TP 2"),
            Product(with: "", name: "TP 3"),
            Product(with: "", name: "TP 4"),
            Product(with: "", name: "TP 5"),
            Product(with: "", name: "TP 6"),
            Product(with: "", name: "TP 7"),
            Product(with: "", name: "TP 8"),
            Product(with: "", name: "TP 9"),
            Product(with: "", name: "TP 10"),
            Product(with: "", name: "TP 11"),
            Product(with: "", name: "TP 12"),
            Product(with: "", name: "TP 13"),
            Product(with: "", name: "TP 14"),
            Product(with: "", name: "TP 15"),
            Product(with: "", name: "TP 16"),
            Product(with: "", name: "TP 17"),

        ]
        let viewController = ProductsCollectionViewController(with: products)

        navigationController?.pushViewController(viewController, animated: true)
    }
}

