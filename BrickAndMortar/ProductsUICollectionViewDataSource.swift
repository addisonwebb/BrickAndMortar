//
//  ProductsUICollectionViewDataSource.swift
//  BrickAndMortar
//
//  Created by Addison Webb on 7/28/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import Foundation

class ProductsUICollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    private let products: [Product]
    
    init(with products: [Product]) {
        self.products = products
        
        super.init()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.reuseIdentifier, for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let product = products[indexPath.row]
        
        cell.setup(with: product)
        
        return cell
    }
}
