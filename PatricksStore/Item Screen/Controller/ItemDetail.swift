//
//  ItemDetail.swift
//  PatricksStore
//
//  Created by Admin on 24/09/21.
//

import UIKit

class ItemDetail: UIViewController, itemTagsCellHeightDelegate {
    
    //MARK: - IB Outlets
    @IBOutlet weak var imgMain: UIImageView!
    
    @IBOutlet weak var btnFav: UIButton!
    
    @IBOutlet weak var colVwItemSnaps: UICollectionView!
    
    @IBOutlet weak var tblViewMain: UITableView!
    
    @IBOutlet weak var tblViewMainHeight: NSLayoutConstraint!
    
    //MARK: - Variables and Constants
    var categoryImagesArray = ["dell","computer","iphone","laptop","Mouse"]
    
    var itemIndexImg = 0
    
    var itemTagCellHeight: CGFloat = 60.0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    //MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set initial image
        self.imgMain.image = UIImage(named: categoryImagesArray[0])
        
        //TableView Height Configuration
        self.tblViewMain.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        tblViewMain.rowHeight = UITableView.automaticDimension
        tblViewMain.estimatedRowHeight = 60
    }
    
    //MARK: - TableView Height Settings
    override func viewDidLayoutSubviews() {
        self.resizeTableview()
    }
    
    func resizeTableview(){
        self.tblViewMainHeight.constant = self.tblViewMain.contentSize.height
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tblViewMain.layer.removeAllAnimations()
        self.tblViewMainHeight.constant = self.tblViewMain.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.tblViewMain.updateConstraints()
            self.tblViewMain.layoutIfNeeded()
        }
    }
    
    deinit{
        self.tblViewMain.removeObserver(self, forKeyPath: "contentSize")
    }
    
    //MARK: - Custom Functions
    
    // To get Item Tag Cell Height
    func sendData(height: CGFloat) {
        itemTagCellHeight = height
    }

    //MARK: - Button Taps
    
    // Back Button Action
    @IBAction func btnAcnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Favourite Button Action
    @IBAction func btnAcnFav(_ sender: UIButton) {
        if sender.isSelected{
            print("Favourite selected")
        }
    }
    
    // Cart Button Action
    @IBAction func btnCartTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Cart Button Tapped")
    }
    
    // Phone Button Action
    @IBAction func btnPhoneTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Phone Button Tapped")
    }
    
    // Profile Button Action
    @IBAction func btnProfileTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Profile Button Tapped")
    }
    
    // Search Button Action
    @IBAction func btnSearchTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Search Button Tapped")
    }
    
    // Choose Size Button Action (Uses Action Sheet for Dropdown Selection)
    @IBAction func btnSizeChange(_ sender: UIButton) {
        
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblViewMain)
        
        if let indexPath = self.tblViewMain.indexPathForRow(at: btnIndex) {
        
        guard let cell = tblViewMain.cellForRow(at: indexPath) as? ItemQuantityCell else { return }
        
        let alert = UIAlertController(title: "Choose your size", message: "", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Small", style: .default , handler:{ (UIAlertAction)in
            //print("User tapped on Small button")
            cell.lblSizeValue.text = "S"
        }))
        
        alert.addAction(UIAlertAction(title: "Medium", style: .default , handler:{ (UIAlertAction)in
            //print("User tapped on Medium button")
            cell.lblSizeValue.text = "M"
        }))
        
        alert.addAction(UIAlertAction(title: "Large", style: .default , handler:{ (UIAlertAction)in
            //print("User tapped on Large button")
            cell.lblSizeValue.text = "L"
        }))
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            //print("User tapped on Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            //print("Completion Block")
        })
    }
        
    }
    
}

//MARK: - Collection View Logic
extension ItemDetail: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryImagesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemImageSnap", for: indexPath) as! ItemImageSnap
        cell.imgItem.image = UIImage(named: categoryImagesArray[indexPath.item])
        
        if indexPath.item == itemIndexImg {
            cell.setupCellSelection()
        } else {
            cell.setupCellDeSelection()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 60, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        itemIndexImg = indexPath.item
        self.imgMain.image = UIImage(named: categoryImagesArray[indexPath.item])
        colVwItemSnaps.reloadData()
    }
    
}

//MARK: - Table View Logic
extension ItemDetail: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 37
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "itemDetailsCell", for: indexPath) as! itemDetailsCell
                return cell
                
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemQuantityCell", for: indexPath) as! ItemQuantityCell
                cell.awakeFromNib()
                return cell
            
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTagsCell", for: indexPath) as! ItemTagsCell
                cell.itemTagDelegate = self
                return cell
                
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSellerNameCell") as! ItemSellerNameCell
                return cell
                
            case 4:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTabSelectCell") as! ItemTabSelectCell
                return cell
            
            case 5:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDescriptionCell") as! ItemDescriptionCell
                return cell
                
            case 6:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationTitleCell") as! SpecificationTitleCell
                cell.lblSpecificationTitle.text = "SPECIFICATIONS"
                return cell
                
            case 7:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationCategoryCell") as! SpecificationCategoryCell
                cell.lblSpecificationCategory.text = "General"
                return cell
            
            case 8:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Model Name"
                cell.lblSpecificationItemValue.text = "MDR-ZX110AP"
                return cell
            
            case 9:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Color"
                cell.lblSpecificationItemValue.text = "Black"
                return cell
            
            case 10:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Headphone"
                cell.lblSpecificationItemValue.text = "Type On the Ear"
                return cell
                
            case 11:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Inline Remote"
                cell.lblSpecificationItemValue.text = "Yes"
                return cell
                
            case 12:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Sales Package"
                cell.lblSpecificationItemValue.text = "1 HEADSET"
                return cell
                
            case 13:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Connectivity"
                cell.lblSpecificationItemValue.text = "Wired"
                return cell
            
            case 14:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationCategoryCell") as! SpecificationCategoryCell
                cell.lblSpecificationCategory.text = "Product Details"
                return cell
                
            case 15:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Deep Bass"
                cell.lblSpecificationItemValue.text = "No"
                return cell
                
            case 16:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Circumaural/Supraaural "
                cell.lblSpecificationItemValue.text = "Circumaural"
                return cell
                
            case 17:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Open/Closed Back"
                cell.lblSpecificationItemValue.text = "Closed Back"
                return cell
                
            case 18:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Other Features"
                cell.lblSpecificationItemValue.text = "Stereo Mini Plug, Sony Smart Key App, Four-conductor, Dynamic Driver Unit"
                return cell
                
            case 19:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Headphone Driver"
                cell.lblSpecificationItemValue.text = "30 mm"
                return cell
                
            case 20:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Units"
                cell.lblSpecificationItemValue.text = "L-shape"
                return cell
                
            case 21:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Cord Type"
                cell.lblSpecificationItemValue.text = "Yes"
                return cell
                
            case 22:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationCategoryCell") as! SpecificationCategoryCell
                cell.lblSpecificationCategory.text = "Sound Features"
                return cell
            
            case 23:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Sensitivity"
                cell.lblSpecificationItemValue.text = "98 dB/mW"
                return cell
                
            case 24:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Impedance"
                cell.lblSpecificationItemValue.text = "24 Ohm"
                return cell
                
            case 25:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Minimum Frequency Response"
                cell.lblSpecificationItemValue.text = "12 Hz"
                return cell
                
            case 26:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Maximum Frequency Response"
                cell.lblSpecificationItemValue.text = "22000 Hz"
                return cell
                
            case 27:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Other Sound Features"
                cell.lblSpecificationItemValue.text = "Clear and Powerful Sound"
                return cell
                
            case 28:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationCategoryCell") as! SpecificationCategoryCell
                cell.lblSpecificationCategory.text = "Dimensions"
                return cell
                
            case 29:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Weight Without Cord"
                cell.lblSpecificationItemValue.text = "120 g"
                return cell
                
            case 30:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Cord Length"
                cell.lblSpecificationItemValue.text = "1.2 m"
                return cell
            
            case 31:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationCategoryCell") as! SpecificationCategoryCell
                cell.lblSpecificationCategory.text = "Warranty"
                return cell
                
            case 32:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Warranty Summary"
                cell.lblSpecificationItemValue.text = "1 Year"
                return cell
                
            case 33:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Covered in Warranty"
                cell.lblSpecificationItemValue.text = "Warranty of the Product is Limited to Manufacturing Defects Only"
                return cell
                
            case 34:
                let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificationItemCell") as! SpecificationItemCell
                cell.lblSpecificationItemField.text = "Not Covered in Warranty"
                cell.lblSpecificationItemValue.text = "Warranty of the product is limited to manufacturing defects only"
                return cell
            
            case 35:
                let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedProductsTitleCell") as! RelatedProductsTitleCell
                return cell
            
            case 36:
                let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedProductsCell") as! RelatedProductsCell
                return cell
                
            default:
                return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let index = indexPath.row
        
        if index == 0 {
            return 142.0
            
        } else if index == 1 {
            return 62.0
            
        } else if index == 2 {
            return itemTagCellHeight
            
        } else if index == 3 {
            return 236.0
            
        } else if index == 4 {
            return 45.0
            
        } else if index == 36 {
            return 333.0
            
        } else {
            return UITableView.automaticDimension
        }
        
    }
    
}
