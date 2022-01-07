//
//  TittleTableCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 03/01/22.
//

import UIKit

class TittleTableCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnViewAll: UIButton!
    
    @IBOutlet weak var lblTittle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func layoutSubviews() {
        Helper.borderAndborderColourSetUIButton(button: self.bttnViewAll, borderWidth: 1.0, colour: .black)
        Helper.cornerSetButton(button: self.bttnViewAll, radiousValue: 15.0)
    }
    
}
