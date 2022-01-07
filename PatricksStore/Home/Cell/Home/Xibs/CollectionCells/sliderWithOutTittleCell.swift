//
//  sliderWithOutTittleCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 30/12/21.
//

import UIKit

class sliderWithOutTittleCell: UICollectionViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var sliderImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func layoutSubviews() {
        Helper.cornerSetImageView(image: self.sliderImageView, radiousValue: 15.0)
    }

}
