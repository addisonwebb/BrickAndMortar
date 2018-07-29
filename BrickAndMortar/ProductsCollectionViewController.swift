//
//  ProductsCollectionViewController.swift
//  BrickAndMortar
//
//  Created by Addison Webb on 7/26/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import UIKit

public class ProductsCollectionViewController: UICollectionViewController {
    
    private let dataSource: ProductsUICollectionViewDataSource
    private let delegate: UICollectionViewDelegate
    private var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = CGSize(width: 200.0, height: 300.0)
        layout.minimumLineSpacing = 8
        layout.scrollDirection = .vertical
        layout.sectionInsetReference = .fromSafeArea
        
        return layout
    }()
    
    public convenience init(with products: [Product], numberOfItemsInRow: Int? = nil) {
        let dataSource = ProductsUICollectionViewDataSource(with: products)
        self.init(with: dataSource, delegate: ProductsCollectionViewDelegate(withNumberOfItemsInRow: numberOfItemsInRow))
    }
    
    init(with dataSource: ProductsUICollectionViewDataSource, delegate: UICollectionViewDelegate) {
        self.dataSource = dataSource
        self.delegate = delegate
        super.init(collectionViewLayout: layout)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.dataSource = dataSource
        collectionView?.delegate = delegate
        collectionView?.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.reuseIdentifier)
        collectionView?.backgroundColor = .white
        collectionView?.contentInset = UIEdgeInsets(top: 16.0, left: 0, bottom: 0, right: 16.0)
    }

}
