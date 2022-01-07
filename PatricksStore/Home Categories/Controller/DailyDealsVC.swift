//
//  DailyDealsVC.swift
//  PatricksStore
//
//  Created by Admin on 14/09/21.
//

import UIKit

class DailyDealsVC: UIViewController, dealsOfDayButtonTapDelegate {
    
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblDealsofday: UILabel!
    
    @IBOutlet weak var lblDay: UILabel!
    
    @IBOutlet weak var lblHours: UILabel!
    
    @IBOutlet weak var lblMinutes: UILabel!
    
    @IBOutlet weak var lblSeconds: UILabel!
    
    //MARK: - Variables and Constants
    var countTimer:Timer!

    var counter = 120000

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Setup Counter
    override func viewWillAppear(_ animated: Bool) {
        self.countTimer = Timer.scheduledTimer(timeInterval: 1 ,target: self,selector: #selector(self.changeTitle),userInfo: nil,repeats: true)
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Setup status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Title Label
        self.lblTitle.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblTitle?.textColor = .white
        
        // Deals of Day Label
        self.lblDealsofday.font = UIFont(name: "Barlow-SemiBold", size: 14)
        self.lblDealsofday?.textColor = Helper.colorFromHexString(hex: "#262626")
   
    }
    
    //MARK: - Change Label Title based on Timer
    @objc func changeTitle() {
        
        if counter != 0 {
            var value = counter
            let day = value/(60*60*24)
            value -= day * (60*60*24)
            let hour = value/(60*60)
            value -= hour * (60*60)
            let min = value/60
            value -= min*60
            self.lblDay.text = "\(day)"
            self.lblHours.text = "\(hour)"
            self.lblMinutes.text = "\(min)"
            self.lblSeconds.text = "\(value)"
            counter -= 1
            
        } else {
            countTimer.invalidate()
            self.lblDay.text = "0"
            self.lblHours.text = "0"
            self.lblMinutes.text = "0"
            self.lblSeconds.text = "0"
        }
    }
 
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Delegate Button Actions
    
    // Add to Cart Button Action
    func addToCartButtonSelection() {
        Helper.showAlert(message: "Add to Cart Button Tapped")
    }
    
}

//MARK: - Table View Logic
extension DailyDealsVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let indexofRow = indexPath.row % 2
        
        switch indexofRow {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DealsofDayHeaderTblCell") as! DealsofDayHeaderTblCell
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "DealsofDayImageTableviewCell") as! DealsofDayImageTableviewCell
                cell.buttonSelectionDelegate = self
                return cell
                
            default:
                return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let indexofRow = indexPath.row % 2
        
        switch indexofRow {
            case 0:
               return UITableView.automaticDimension
            case 1:
                return 300
            default:
                return UITableView.automaticDimension
        }
    }
}
