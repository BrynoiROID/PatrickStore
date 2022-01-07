//
//  WalletVC.swift
//  PatricksStore
//
//  Created by Admin on 20/09/21.
//

import UIKit

class WalletVC: UIViewController, walletButtonTapDelegate {
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var colVwHeader: UICollectionView!
    
    @IBOutlet weak var tblVwWallet: UITableView!
    
    @IBOutlet weak var vwSubTable: UIView!
    
    @IBOutlet weak var heightTotalRewards: NSLayoutConstraint!
    
    @IBOutlet weak var vwCashBack: UIView!
    
    @IBOutlet weak var lblCashBack: UILabel!
    
    @IBOutlet weak var lblCashBackAmount: UILabel!
    //MARK: - Variables and Constants
    var selectedIndexvalue = 0
    
    let headerTitle = ["Reward Point", "Cashback"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        // Set title label
        self.lblTitle.font = UIFont(name: "Barlow-SemiBold", size: 20)
        self.lblTitle?.textColor = .white
        // Total Reward Height
        self.heightTotalRewards.constant = (selectedIndexvalue == 0 ? 0 : 60)
        // Cashback Label
        self.lblCashBack.font = UIFont(name: "Barlow-Medium", size: 17)
        // Cashback Amount Label
        self.lblCashBackAmount.font = UIFont(name: "Barlow-Regular", size: 30)
        //MARK: - Swipe Gestures
        // Swipe table to right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.vwSubTable.addGestureRecognizer(swipeRight)
        // Swipe table to left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.vwSubTable.addGestureRecognizer(swipeLeft)
    }
    //MARK: - Tab Swiping Logic
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                changeIndexToLeft()
            case UISwipeGestureRecognizer.Direction.left:
                changeIndexToRight()
            default:
                break
            }
        }
    }
    //MARK: - Change Index to Right
    func changeIndexToRight() {
        if selectedIndexvalue < headerTitle.count - 1 {
            selectedIndexvalue += 1
            self.colVwHeader.reloadData()
            self.colVwHeader.scrollToItem(at: [0,selectedIndexvalue], at: .centeredHorizontally, animated: true)
            self.tblVwWallet.reloadData()
            self.heightTotalRewards.constant = (selectedIndexvalue == 0 ? 0 : 60)
        }
    }
    //MARK: - Change Index to Left
    func changeIndexToLeft() {
        if selectedIndexvalue <= headerTitle.count - 1 && selectedIndexvalue != 0 {
            selectedIndexvalue -= 1
            self.colVwHeader.reloadData()
            self.colVwHeader.scrollToItem(at: [0,selectedIndexvalue], at: .centeredHorizontally, animated: true)
            self.tblVwWallet.reloadData()
            self.heightTotalRewards.constant = (selectedIndexvalue == 0 ? 0 : 60)
        }
    }
    //MARK: - Button Actions
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: - Delegate Button Actions
    // Earn Button Action
    func earnButtonSelection() {
        Helper.showAlert(message: "Earn Button Tapped")
    }
    // Redeem Button Action
    func redeemButtonSelection() {
        Helper.showAlert(message: "Redeem Button Tapped")
    }
}
//MARK: - Collection View Logic
extension WalletVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerTitle.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colVwWalletCell", for: indexPath) as! colVwWalletCell
        cell.flag = (indexPath.item == selectedIndexvalue ? true : false)
        cell.lblTitle.text = headerTitle[indexPath.item]
        cell.initialSetup()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexvalue = indexPath.row
        colVwHeader.reloadData()
        colVwHeader.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        tblVwWallet.reloadData()
        self.heightTotalRewards.constant = (selectedIndexvalue == 0 ? 0 : 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizeWidth = CGFloat(collectionView.bounds.width/2) - 5
        let sizeHeight = CGFloat(40)
        return CGSize(width: sizeWidth, height: sizeHeight)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
//MARK: - Table View Logic
extension WalletVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (selectedIndexvalue == 0 ? 1 : 6)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedIndexvalue == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "walletTblVwCell") as! walletTblVwCell
            cell.value = 75
            cell.buttonSelectionDelegate = self
            cell.awakeFromNib()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CashBackTblVwCell") as! CashBackTblVwCell
            cell.awakeFromNib()
            return cell
        }
    }
}
