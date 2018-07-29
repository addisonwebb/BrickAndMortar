//
//  ProductCollectionViewCell.swift
//  BrickAndMortar
//
//  Created by Addison Webb on 7/26/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import UIKit

public class ProductCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = "ProductCollectionViewCell"
    public override var reuseIdentifier: String {
        return ProductCollectionViewCell.reuseIdentifier
    }
    
    private let nameLabel = UILabel()
    
    // MARK: - Lifecycle methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalToConstant: 200.0),
            contentView.heightAnchor.constraint(equalToConstant: 300.0),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        backgroundColor = .lightGray
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.layer.borderWidth = 1.0
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func prepareForReuse() {
        nameLabel.text = ""
    }
    
    public func setup(with product: Product) {
        nameLabel.text = product.name
    }
}
