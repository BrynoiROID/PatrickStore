//
//  tblMyAddressesCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import UIKit

class tblMyAddressesCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblContactNo: UILabel!
    
    @IBOutlet weak var bttnEdit: UIButton!
    
    @IBOutlet weak var bttnDelete: UIButton!
    
    @IBOutlet weak var lblHomeType: UILabel!
    
    //MARK: - Variables and Constants
    var itemDetails : Items?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set Bottom Shadow for view
        Helper.shadowSetViewBottom(view: self.viewBG)
        
        // Set Corner Radius for label
        Helper.cornerSetView(view: lblHomeType, radiousValue: 10)
       
        
        //Listing Address Details
        if itemDetails != nil {
            self.lblName.text = itemDetails?.name
            self.lblAddress.text = "\(itemDetails!.address1 ?? "") , \(itemDetails!.landMark ?? "")"
            self.lblContactNo.text = itemDetails?.contactNumber
            self.lblHomeType.text = itemDetails?.label
        }
    }
}
