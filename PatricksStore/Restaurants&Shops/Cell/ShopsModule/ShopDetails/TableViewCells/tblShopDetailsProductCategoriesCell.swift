//
//  tblShopDetailsProductCategoriesCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class tblShopDetailsProductCategoriesCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var viewBG: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set border width and border color for view
        Helper.borderAndborderColourSetUIView(view: self.viewBG, borderWidth: 1.0, colour: .black)
        
        // Set Corner Radius for view
        Helper.cornerSetView(view: self.viewBG, radiousValue: 5.0)
    }

}
