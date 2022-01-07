//
//  walletTblVwCell.swift
//  PatricksStore
//
//  Created by Admin on 21/09/21.
//

import UIKit

//MARK: - Wallet Button Tap Delegate
protocol walletButtonTapDelegate {
    
    func earnButtonSelection()
    
    func redeemButtonSelection()
}

class walletTblVwCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblReward: UILabel!
    
    @IBOutlet weak var lblSubheader: UILabel!
    
    @IBOutlet weak var PrgressBarRewards: UIProgressView!
    
    @IBOutlet weak var lblMinPoint: UILabel!
    
    @IBOutlet weak var lblCurrentValue: UILabel!
    
    @IBOutlet weak var lblMaxValue: UILabel!
    
    @IBOutlet weak var btnEarn: UIButton!
    
    @IBOutlet weak var btnRedeem: UIButton!
    
    //MARK: - Variables and Constants
    var value = 0
    var buttonSelectionDelegate: walletButtonTapDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Reward Label
        self.lblReward.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblReward.textColor = Helper.colorFromHexString(hex: "#343434")
        
        // Subheader Label
        self.lblSubheader.font = UIFont(name: "Barlow-Medium", size: 14)
        self.lblSubheader.textColor = Helper.colorFromHexString(hex: "#343434")
        
        // Rewards Progress Bar
        self.PrgressBarRewards.layer.cornerRadius = 10
        self.PrgressBarRewards.clipsToBounds = true
        self.PrgressBarRewards.layer.sublayers![1].cornerRadius = 10
        self.PrgressBarRewards.subviews[1].clipsToBounds = true
        self.PrgressBarRewards.setProgress(Float(value)/150, animated: true)
        
        // Minimum Value Label
        self.lblMinPoint.font = UIFont(name: "Barlow-Medium", size: 16)
        self.lblMinPoint.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Current Value Label
        self.lblCurrentValue.font = UIFont(name: "Barlow-Medium", size: 16)
        self.lblCurrentValue.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Maximum Value Label
        self.lblMaxValue.font = UIFont(name: "Barlow-Medium", size: 16)
        self.lblMaxValue.textColor = Helper.colorFromHexString(hex: "#262626")
        
        // Earn Button
        self.btnEarn.titleLabel?.font = UIFont(name: "Barlow-Medium", size: 18)
        
        // Redeem Button
        self.btnRedeem.titleLabel?.font = UIFont(name: "Barlow-Medium", size: 18)
    }
    
    //MARK: - Button Actions
    
    // Earn Button Action
    @IBAction func BtnAcnEarn(_ sender: UIButton) {
        self.buttonSelectionDelegate.earnButtonSelection()
    }
    
    // Redeem Button Action
    @IBAction func btnAcnRedeem(_ sender: UIButton) {
        self.buttonSelectionDelegate.redeemButtonSelection()
    }
}
