//
//  OrderDetailsTimelineItemTVCell.swift
//  PatricksStore
//
//  Created by Admin on 27/09/21.
//

import UIKit

class OrderDetailsTimelineItemTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubtitle: UILabel!
    
    @IBOutlet weak var vwTopBar: UIView!
    
    @IBOutlet weak var vwDot: UIView!
    
    @IBOutlet weak var vwBottomBar: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
