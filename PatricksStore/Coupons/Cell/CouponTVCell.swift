//
//  CouponTVCell.swift
//  PatricksStore
//
//  Created by Admin on 29/09/21.
//

import UIKit

class CouponTVCell: UITableViewCell {

    //MARK: - IB Outlets
    @IBOutlet weak var vwLeftCoupon: UIView!
    
    @IBOutlet weak var vwRightCoupon: UIView!
    
    @IBOutlet weak var vwRightTear: UIView!
    
    @IBOutlet weak var lblDiscount: UILabel!
    
    @IBOutlet weak var lblExpiryDate: UILabel!
    
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // To make left view rounded
        vwLeftCoupon.clipsToBounds = false
        if #available(iOS 11.0, *) {
            vwLeftCoupon.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        vwLeftCoupon.layer.cornerRadius = 10
        
        // To make right view rounded
        vwRightCoupon.clipsToBounds = false
        if #available(iOS 11.0, *) {
            vwRightCoupon.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
        vwRightCoupon.layer.cornerRadius = 10
        
        // Discount Label
        lblDiscount.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        lblDiscount.text = "DISCOUNT"
        
        // Set shadow on Right Coupon View
        Helper.shadowSetCardView(view: vwRightCoupon)
        
        // Setup tear view on Right Coupon View
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: vwRightTear.bounds.size.width, y: vwRightTear.bounds.size.height/2), radius: vwRightTear.bounds.size.width/2, startAngle: .pi*(3/2), endAngle: .pi/2, clockwise: false)
        let circleShape = CAShapeLayer()
        circleShape.lineWidth = 2
        circleShape.path = circlePath.cgPath
        if #available(iOS 13.0, *) {
            circleShape.strokeColor = UIColor.systemGray5.cgColor
        } else {
            circleShape.strokeColor = Helper.systemGray5Equal.cgColor
        }
        circleShape.fillColor = UIColor.clear.cgColor
        if #available(iOS 13.0, *) {
            circleShape.shadowColor = UIColor.systemGray5.cgColor
        } else {
            circleShape.shadowColor = Helper.systemGray5Equal.cgColor
        }
        circleShape.shadowOffset = CGSize(width: 0.0, height: 0.0)
        circleShape.shadowRadius = 1
        circleShape.shadowOpacity = 0.7
        vwRightTear.layer.mask = circleShape
        vwRightTear.layer.addSublayer(circleShape)
        
    }

}
