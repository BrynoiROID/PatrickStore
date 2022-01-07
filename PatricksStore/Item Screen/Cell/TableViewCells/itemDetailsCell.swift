//
//  itemDetailsCell.swift
//  PatricksStore
//
//  Created by Admin on 28/09/21.
//

import UIKit

class itemDetailsCell: UITableViewCell {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblInAvalability: UILabel!
    
    @IBOutlet weak var lblInStock: UILabel!
    
    @IBOutlet weak var imgInStock: UIImageView!
    
    @IBOutlet weak var vwRating: UIView!
    
    @IBOutlet weak var lblRating: UILabel!
    
    @IBOutlet weak var lblReviewCount: UILabel!
    
    @IBOutlet weak var lblReviews: UILabel!
    
    @IBOutlet weak var lblCurrentPrice: UILabel!
    
    @IBOutlet weak var lblOldPrice: UILabel!
    
    @IBOutlet weak var vwDiscount: UIView!
    
    @IBOutlet weak var lblDiscountPercent: UILabel!
    
    @IBOutlet weak var lblOff: UILabel!
    
    @IBOutlet weak var lblDays: UILabel!
    
    @IBOutlet weak var lblDaysCount: UILabel!
    
    @IBOutlet weak var lblHours: UILabel!
    
    @IBOutlet weak var lblHoursCount: UILabel!
    
    @IBOutlet weak var lblMinutes: UILabel!
    
    @IBOutlet weak var lblMinutesCount: UILabel!
    
    @IBOutlet weak var lblSecoundsCount: UILabel!
    
    @IBOutlet weak var lblSeconds: UILabel!
    
    //MARK: - Variables and Constants
    var countTimer:Timer!

    var counter = 120000
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }

    //MARK: - Initial Setup
    func initialSetup() {
        
        // Old Price Label
        self.lblOldPrice.attributedText = self.lblOldPrice.text?.strikeThrough()
        
        // Count Timer
        self.countTimer = Timer.scheduledTimer(timeInterval: 1 ,target: self,selector: #selector(self.changeTitle),userInfo: nil,repeats: true)
    }
    
    //MARK: - Setup Counter Labels
    @objc func changeTitle() {
        if counter != 0 {
            var value = counter
            let day = value/(60*60*24)
            value -= day * (60*60*24)
            let hour = value/(60*60)
            value -= hour * (60*60)
            let min = value/60
            value -= min*60
            
            self.lblDaysCount.text = "\(day)"
            self.lblHoursCount.text = "\(hour)"
            self.lblMinutesCount.text = "\(min)"
            self.lblSecoundsCount.text = "\(value)"
            
            counter -= 1
        } else {
            countTimer.invalidate()
            
            self.lblDaysCount.text = "0"
            self.lblHoursCount.text = "0"
            self.lblMinutesCount.text = "0"
            self.lblSecoundsCount.text = "0"
        }
        
    }
}
