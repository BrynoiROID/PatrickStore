//
//  OrderDetailsTimelineTVCell.swift
//  PatricksStore
//
//  Created by Admin on 24/09/21.
//

import UIKit

class OrderDetailsTimelineTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var tblTimeline: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        // Table Settings
        tblTimeline.dataSource = self
        tblTimeline.delegate = self
    }
    
}

//MARK: - Order Details Timeline Table Logic
extension OrderDetailsTimelineTVCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        switch index {
        
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTimelineItemTVCell") as! OrderDetailsTimelineItemTVCell
                cell.lblTitle.text = "Ordered and Approved"
                cell.lblSubtitle.text = "Your Order has been placed."
                cell.vwTopBar.isHidden = true
                cell.vwDot.backgroundColor = Helper.colorFromHexString(hex: "#039508")
                cell.vwBottomBar.backgroundColor = Helper.colorFromHexString(hex: "#039508")
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTimelineItemTVCell") as! OrderDetailsTimelineItemTVCell
                cell.lblTitle.text = "Packed"
                cell.lblSubtitle.text = "Your item has been picked up by courier partner."
                cell.vwDot.layer.borderWidth = 2
                cell.vwDot.layer.borderColor = Helper.colorFromHexString(hex: "#039508").cgColor
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTimelineItemTVCell") as! OrderDetailsTimelineItemTVCell
                cell.lblTitle.text = "Shipped"
                cell.lblSubtitle.text = "Your item has been shipped."
                cell.vwDot.layer.borderWidth = 2
                cell.vwDot.layer.borderColor = Helper.colorFromHexString(hex: "#039508").cgColor
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "OrderDetailsTimelineItemTVCell") as! OrderDetailsTimelineItemTVCell
                cell.lblTitle.text = "Delivered"
                cell.lblSubtitle.text = "Your item has been delivered"
                cell.vwBottomBar.isHidden = true
                cell.vwDot.layer.borderWidth = 2
                cell.vwDot.layer.borderColor = Helper.colorFromHexString(hex: "#039508").cgColor
                return cell
                
            default:
                return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 74.0
    }
}
