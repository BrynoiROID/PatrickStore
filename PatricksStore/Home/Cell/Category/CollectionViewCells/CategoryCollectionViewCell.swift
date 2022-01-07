//
//  CategoryCollectionViewCell.swift
//  PatricksStore
//
//  Created by Admin on 25/08/21.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var categoryView: UIView!
    
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Category View
        categoryView.layer.cornerRadius = categoryView.frame.height / 2.0
    }
}
