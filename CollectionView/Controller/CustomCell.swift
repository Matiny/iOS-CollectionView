//
//  CustomCell.swift
//  CollectionView
//
//  Created by Matiny L on 5/29/20.
//  Copyright © 2020 Matiny L. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    @IBOutlet var labelColor: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    public func configure(number: Int, color: UIColor) {
        labelColor.text = "\(number)"
        labelColor.backgroundColor = color
    }
    
    static func nib() -> UINib {
         return UINib(nibName: "CustomCell", bundle: nil)
    }

}
