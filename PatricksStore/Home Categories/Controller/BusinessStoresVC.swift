//
//  BusinessStoresVC.swift
//  PatricksStore
//
//  Created by Admin on 16/09/21.
//

import UIKit

class BusinessStoresVC: UIViewController, UISearchBarDelegate {
    //MARK: - IB Outlets
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var clvVwSubTitles: UICollectionView!
    
    @IBOutlet weak var vwDisplay: UIView!
    
    @IBOutlet weak var tblVwSub: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    //MARK: - Variables and Constants
    var indexValue = 0
    let DmyArray = ["Food & Beverages", "Mobile & Laptop", "All", "Food & Beverages", "Mobile & Laptop", "All", "Food & Beverages", "Mobile & Laptop", "All"]
    
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
        //MARK: - Swipe Gesture
        // Swipe table to right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.vwDisplay.addGestureRecognizer(swipeRight)
        // Swipe table to left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.vwDisplay.addGestureRecognizer(swipeLeft)
        // Search Bar
        searchBar.delegate = self
    }
    //MARK: - Search Bar Handling
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if UIApplication.shared.isKeyboardPresented {
            self.view.endEditing(true)
        }
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
        if indexValue < DmyArray.count - 1 {
            indexValue += 1
            self.clvVwSubTitles.reloadData()
            self.clvVwSubTitles.scrollToItem(at: [0,indexValue], at: .centeredHorizontally, animated: true)
            self.tblVwSub.reloadData()
        }
    }
    //MARK: - Change Index to Left
    func changeIndexToLeft() {
        if indexValue <= DmyArray.count - 1 && indexValue != 0 {
            indexValue -= 1
            self.clvVwSubTitles.reloadData()
            self.clvVwSubTitles.scrollToItem(at: [0,indexValue], at: .centeredHorizontally, animated: true)
            self.tblVwSub.reloadData()
        }
    }
    //MARK: - Button Actions
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    // Search Button Action
    @IBAction func btnAcnSearch(_ sender: UIButton) {
    }
    // Profile Button Action
    @IBAction func btnAcnProfile(_ sender: UIButton) {
    }
    // Phone Button Action
    @IBAction func btnAcnPhone(_ sender: UIButton) {
    }
    // Cart Button Action
    @IBAction func btnAcnCart(_ sender: UIButton) {
    }
    // Filter Button Action
    @IBAction func btnAcnSubFilter(_ sender: UIButton) {
    }
    // Sort Button Action
    @IBAction func btnAcnSort(_ sender: UIButton) {

    }
}
//MARK: - Collection View Logic
extension BusinessStoresVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DmyArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BusinessStoresColVwCell", for: indexPath) as! BusinessStoresColVwCell
        cell.lblTitle.text = DmyArray[indexPath.item]
        cell.flag = ( indexPath.item == indexValue ? true : false)
        cell.initialSetupToCell()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemStringSizeLength = NSAttributedString(string: DmyArray[indexPath.item], attributes: [.font: UIFont(name: "Barlow-Medium", size: 16.0)!])
        return CGSize(width: itemStringSizeLength.size().width+40, height: 42)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        indexValue = indexPath.item
        clvVwSubTitles.reloadData()
        clvVwSubTitles.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
//MARK: - Table View Logic
extension BusinessStoresVC:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessStoresTblVwCell") as! BusinessStoresTblVwCell
        cell.awakeFromNib()
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Clicked at index = \(indexPath)")
    }
    // To dismiss keyboard when table is scrolled
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        if targetContentOffset.pointee.y < scrollView.contentOffset.y {
            if UIApplication.shared.isKeyboardPresented {
                self.view.endEditing(true)
            }
        } else {
            if UIApplication.shared.isKeyboardPresented {
                self.view.endEditing(true)
            }
        }
    }
}

