//
//  AddressTableViewCell.swift
//  PatricksStore
//
//  Created by Admin on 09/09/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var btnChangeLocation: UIButton!
    
    @IBOutlet weak var innerView: UIView!
    
    @IBOutlet weak var btnCurrentLocation: UIButton!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblPlace: UILabel!
    
    @IBOutlet weak var lblMobileNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Change Location Button
        btnChangeLocation.layer.borderWidth = 1
        btnChangeLocation.layer.borderColor = Helper.colorFromHexString(hex: "#707070").cgColor
        btnChangeLocation.layer.cornerRadius = 5.0
        
        // Set bottom shadow for view
        Helper.shadowSetViewBottom(view: innerView)
        
        // Current Location Button
        btnCurrentLocation.layer.cornerRadius = 9.0
    }
    
}
