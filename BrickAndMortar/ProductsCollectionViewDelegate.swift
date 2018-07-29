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
        print("-------------------- begin calculating inset -------------------------")
        
        let screenWidth = UIScreen.main.bounds.width
        let viewWidth = screenWidth - collectionView.safeAreaInsets.left - collectionView.safeAreaInsets.right
        print("Screen width: \(screenWidth)")
        print("View width: \(viewWidth)")
        
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
        print("Number of cells that will fit in a row: \(numberOfCellsThatFitInRow)")
        
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
        print("Final number of cells in row: \(cellsInRow)")
        
        let totalCellWidth = cellsInRow * cellWidth
        let totalSpaceWidth = (cellsInRow - 1.0) * interItemSpacing
        let inset = (viewWidth - totalCellWidth - totalSpaceWidth) / 2.0
        
        print("Total cell width: \(totalCellWidth)")
        print("Total space width: \(totalSpaceWidth)")
        print("Inset: \(inset)")
        
        print("total cell width + total space width + 2(inset) = total view width")
        print("\(totalCellWidth) + \(totalSpaceWidth) + \(inset * 2.0) = \(viewWidth)")
        print("\(totalCellWidth + totalSpaceWidth + (inset * 2.0)) = \(viewWidth)")
        
        print("-------------------- end calculating inset -------------------------")
        
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(interItemSpacing)
    }
}
