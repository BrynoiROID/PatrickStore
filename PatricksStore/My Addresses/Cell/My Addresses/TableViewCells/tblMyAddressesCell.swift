//
//  tblMyAddressesCell.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//

import UIKit

//MARK: - Current Button Tap Delegate
protocol currentButtonTapDelegate {
    
    func editButtonSelection(indexValue: Int)
    
    func deleteButtonSelection(indexValue: Int)
}

class tblMyAddressesCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblAddress: UILabel!
    
    @IBOutlet weak var lblContactNo: UILabel!
    
    @IBOutlet weak var bttnEdit: UIButton!
    
    @IBOutlet weak var bttnDelete: UIButton!
    
    //MARK: - Variables and Constants
    var buttonSelectionDelegate : currentButtonTapDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Set Bottom Shadow for view
        Helper.shadowSetViewBottom(view: self.viewBG)
    }
    
    //MARK: - Button Actions
    
    // Edit Button Action
    @IBAction func editButtonTapped(_ sender: UIButton) {
        self.buttonSelectionDelegate.editButtonSelection(indexValue: sender.tag)
    }
    
    // Delete Button Action
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        self.buttonSelectionDelegate.deleteButtonSelection(indexValue: sender.tag)
    }
}
