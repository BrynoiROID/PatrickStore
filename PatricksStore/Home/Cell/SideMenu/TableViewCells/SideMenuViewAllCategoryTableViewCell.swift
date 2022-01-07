//
//  SideMenuViewAllCategoryTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 28/09/21.
//

import UIKit

class SideMenuViewAllCategoryTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblViewAll: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // View All Label
        lblViewAll.underline()
    }

}
