//
//  sliderWithTittleCollectionCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 03/01/22.
//

import UIKit

class sliderWithTittleCollectionCell: UICollectionViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var sliderImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.initialSetup()
    }
    override func layoutSubviews() {
        Helper.cornerSetView(view: self.backView, radiousValue: 10)
        Helper.cornerSetImageView(image: self.sliderImageView, radiousValue: 10)
        Helper.shadoweSetView(view: self.backView)
    }
    //MARK: - Initial Setup
    func initialSetup() {

    }
}
