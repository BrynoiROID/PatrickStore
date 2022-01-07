//
//  FestivalOffersVC.swift
//  PatricksStore
//
//  Created by Admin on 09/09/21.
//

import UIKit

class FestivalOffersVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var tblVwFestivalPage: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Title Label
        self.lblTitle.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblTitle?.textColor = .white
    }

    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//MARK: - Table View Logic
extension FestivalOffersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowIndex = indexPath.row
        
        switch rowIndex {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SlideShowCell") as! SlideShowCell
                cell.selectionStyle = .none
                cell.awakeFromNib()
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "twoImgCell") as! twoImgCell
                cell.selectionStyle = .none
                cell.awakeFromNib()
                return cell
                
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SingleImageTblCell") as! SingleImageTblCell
                cell.selectionStyle = .none
                cell.awakeFromNib()
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubTitleCell") as! SubTitleCell
                cell.selectionStyle = .none
                cell.lblTitle.text = "FEATURED BRANDS"
                cell.awakeFromNib()
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "twoImgCell") as! twoImgCell
                cell.selectionStyle = .none
                cell.imgForCell = UIImage(named: "nikeImage")!
                cell.awakeFromNib()
                return cell
                
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubTitleCell") as! SubTitleCell
                cell.selectionStyle = .none
                cell.lblTitle.text = "DIWALI OFFERS"
                cell.awakeFromNib()
                return cell
                
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "FourImageCell") as! FourImageCell
                cell.selectionStyle = .none
                cell.imgForCell = UIImage(named: "Big Deals")!
                cell.awakeFromNib()
                return cell
                
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SubTitleCell") as! SubTitleCell
                cell.selectionStyle = .none
                cell.lblTitle.text = "CATEGORIES TO BAG"
                cell.awakeFromNib()
                return cell
                
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SixImgCell") as! SixImgCell
                cell.selectionStyle = .none
                cell.imgForCell = UIImage(named: "Big Deals")!
                cell.awakeFromNib()
                return cell
                
            default:
                return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowIndex = indexPath.row
        
        switch rowIndex {
            case 0:
                return 250
            case 1:
                return 150
            case 2:
                return 220
            case 3:
                return 40
            case 4:
                return 150
            case 5:
                return 40
            case 6:
                return 380
            case 7:
                return 40
            case 8:
                return 290
            default:
                return UITableView.automaticDimension
        }
    }
    
}
