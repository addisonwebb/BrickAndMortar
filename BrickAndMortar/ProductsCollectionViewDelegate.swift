//
//  ProductsCollectionViewDelegate.swift
//  BrickAndMortar
//
//  Created by Addison Webb on 7/29/18.
//  Copyright © 2018 Code Bits LLC. All rights reserved.
//

import UIKit

class ProductsCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let itemsInRow: Int?
    private let interItemSpacing: CGFloat = 8.0
    
    init(withNumberOfItemsInRow itemsInRow: Int? = nil) {
        self.itemsInRow = itemsInRow
        super.init()
    }
    
    /// Determines the left and right insets for the section based on the number of items in the row.
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let screenWidth = UIScreen.main.bounds.width
        let viewWidth = screenWidth - collectionView.safeAreaInsets.left - collectionView.safeAreaInsets.right
        
        // get cell width
        let cell = ProductCollectionViewCell(frame: CGRect.zero)
        let size = cell.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        let cellWidth = size.width
        
        // determine how many cells are in a row
        var numberOfCellsThatFitInRow = CGFloat(floor(viewWidth/cellWidth))
        
        // factor in the minimum spacing between cells
        if ((numberOfCellsThatFitInRow - 1) * interItemSpacing) + (numberOfCellsThatFitInRow * cellWidth) > viewWidth {
            numberOfCellsThatFitInRow = numberOfCellsThatFitInRow - 1
        }

        // If provided a number of cells that should be in a row is provided
        // we use the smallest value between how many items fit in a row and
        // the number provided.
        var cellsInRow: CGFloat
        if let maxItemsInRow = itemsInRow {
            let itemsInRow = CGFloat(maxItemsInRow)
            cellsInRow = min(itemsInRow, numberOfCellsThatFitInRow)
        } else {
            cellsInRow = numberOfCellsThatFitInRow
        }
        
        let totalCellWidth = cellsInRow * cellWidth
        let totalSpaceWidth = (cellsInRow - 1.0) * interItemSpacing
        let inset = (viewWidth - totalCellWidth - totalSpaceWidth) / 2.0
        
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(interItemSpacing)
    }
}
