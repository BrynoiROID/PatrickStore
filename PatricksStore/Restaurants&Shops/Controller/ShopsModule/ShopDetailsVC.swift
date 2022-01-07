//
//  ShopDetailsVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 29/09/21.
//

import UIKit

class ShopDetailsVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var bttnSearch: UIButton!
    
    @IBOutlet weak var bttnProfile: UIButton!
    
    @IBOutlet weak var bttnCall: UIButton!
    
    @IBOutlet weak var bttnCart: UIButton!
    
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var viewProfile: UIView!
    
    @IBOutlet weak var imgProfile: UIImageView!
    
    @IBOutlet weak var imgStar: UIImageView!
    
    @IBOutlet weak var clvShopDetailsCategory: UICollectionView!
    
    @IBOutlet weak var tblShopDetails: UITableView!
    
    @IBOutlet weak var tblShopDetailsHeight: NSLayoutConstraint!
    
    //MARK: - Variables and Constants
    var shopDetailsCategoryArray = ["Products","Services","About","Reviews"]
    
    var imgServicesArray = ["Redmi-K20", "Triple-Camera", "LED-TV"]
    
    var clvIndexValue : Int = 0
    
    enum isFrom {
        case Products
        case Services
        case About
        case Reviews
    }
    
    var valueFrom = isFrom.Products
    
    var readMoreFlag = false
    
    var swipeIndexPath = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Set Corner Radius for Image
        Helper.cornerSetImageView(image: self.imgProfile, radiousValue: 10.0)
        
        // Set Bottom Shadow for View
        Helper.shadowSetViewBottom(view: self.viewProfile)
        
        // Set Image Color
        imgStar.setImageColor(color: Helper.colorFromHexString(hex: "#039508"))
        
        //TableView Height Settings
        self.tblShopDetails.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        tblShopDetails.rowHeight = UITableView.automaticDimension
        tblShopDetails.estimatedRowHeight = 40
        
        //Table Separation
        self.tblShopDetails.separatorStyle = .none
        
        //Swipe Gesture Setup
        
        //Swipe table to Right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        tblShopDetails.addGestureRecognizer(swipeRight)
        
        //Swipe table to Left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        tblShopDetails.addGestureRecognizer(swipeLeft)
    }
    
    //MARK: - Table Reload
    func tblShopDetailsReload(indexValue: Int) {
        switch indexValue {
            case 0:
                valueFrom = .Products
                self.tblShopDetails.reloadData()
            case 1:
                valueFrom = .Services
                self.tblShopDetails.reloadData()
                
            case 2:
                valueFrom = .About
                self.tblShopDetails.reloadData()
                
            case 3:
                valueFrom = .Reviews
                self.tblShopDetails.reloadData()
                
            default:
                valueFrom = .Products
                self.tblShopDetails.reloadData()
        }
    }
    
    //MARK: - Tab Swiping Logic
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                print("Swiped right")
                changeIndexToRight()
            case UISwipeGestureRecognizer.Direction.left:
                print("Swiped left")
               changeIndexToLeft()
            default:
                break
            }
        }
    }
    
    //MARK: - Change CollectionView Index to Right
    func changeIndexToRight(){
        
        if swipeIndexPath > 0 {
            self.swipeIndexPath -= 1
            self.clvIndexValue = swipeIndexPath
            self.clvShopDetailsCategory.reloadData()
            self.clvShopDetailsCategory.scrollToItem(at: [0,clvIndexValue], at: .centeredHorizontally, animated: true)
            self.tblShopDetailsReload(indexValue: swipeIndexPath)
        }

    }
    
    //MARK: - Change CollectionView Index to Left
    func changeIndexToLeft(){
        
        if swipeIndexPath < 3 {
            self.swipeIndexPath += 1
            self.clvIndexValue = swipeIndexPath
            self.clvShopDetailsCategory.reloadData()
            self.clvShopDetailsCategory.scrollToItem(at: [0,clvIndexValue], at: .centeredHorizontally, animated: true)
            self.tblShopDetailsReload(indexValue: swipeIndexPath)
        }
        
    }
    
    //MARK: - Enable Touch Gesture
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return true
    }
    
    // MARK: - Get Label Height
    func getLabelHeight(text: String, width: CGFloat, font: UIFont) -> CGFloat {
        let lbl = UILabel(frame: .zero)
        lbl.frame.size.width = width
        lbl.font = font
        lbl.numberOfLines = 0
        lbl.text = text
        lbl.sizeToFit()
        return lbl.frame.size.height
    }
    
    //MARK: - TableView Height Settings
    override func viewDidLayoutSubviews() {
        self.resizeTableview()
    }
    
    func resizeTableview(){
        self.tblShopDetailsHeight.constant = self.tblShopDetails.contentSize.height
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.tblShopDetails.layer.removeAllAnimations()
        self.tblShopDetailsHeight.constant = self.tblShopDetails.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.tblShopDetails.updateConstraints()
            self.tblShopDetails.layoutIfNeeded()
        }
    }
    
    deinit{
        self.tblShopDetails.removeObserver(self, forKeyPath: "contentSize")
    }
    
    //MARK: - Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    //MARK: - SHOP DETAILS ABOUT BUTTONS
    
    //MARK: - Read More Button Action
    @IBAction func readMoreButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblShopDetails)
        
        if let indexPath = self.tblShopDetails.indexPathForRow(at: btnIndex) {
            guard let cell = tblShopDetails.cellForRow(at: indexPath) as? tblShopDetailsAboutCell else { return }
            
                if readMoreFlag {
                    cell.lblDescriptionHeight.constant = 63
                    cell.btnReadMore.setTitle("read more", for: .normal)
                    cell.awakeFromNib()
                    self.readMoreFlag = false
                    self.tblShopDetails.reloadData()
                   
                } else {
                    cell.lblDescriptionHeight.constant = self.getLabelHeight(text: cell.lblDescription.text ?? "", width: self.view.bounds.width, font: cell.lblDescription.font)
                    cell.btnReadMore.setTitle("read less", for: .normal)
                    cell.awakeFromNib()
                    self.readMoreFlag = true
                    self.tblShopDetails.reloadData()
                }
    
        }
        
    }
    
    //MARK: - Contact Seller Button Action
    @IBAction func contactSellerButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblShopDetails)
        
        if let indexPath = self.tblShopDetails.indexPathForRow(at: btnIndex) {
            print("Contact Seller Button Tapped at \(indexPath.row)")
        }
    }
    
    //MARK: - Return Policy Button Action
    @IBAction func returnPolicyButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblShopDetails)
        
        if let indexPath = self.tblShopDetails.indexPathForRow(at: btnIndex) {
            print("Return Policy Button Tapped at \(indexPath.row)")
        }
    }
    
    //MARK: - Products Button Action
    @IBAction func productsButtonTapped(_ sender: UIButton) {
        let btnIndex = sender.convert(sender.bounds.origin, to:self.tblShopDetails)
        
        if let indexPath = self.tblShopDetails.indexPathForRow(at: btnIndex) {
            print("Products Button Tapped at \(indexPath.row)")
        }
    }
    
}

//MARK: - CollectionView Logic
extension ShopDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: - Cell Layouts
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label:UILabel = UILabel()
        label.textColor = Helper.colorFromHexString(hex: "#262626")
        label.font = UIFont(name:"Barlow-Medium", size: 14.0)
        label.numberOfLines = 1
        label.text = self.shopDetailsCategoryArray[indexPath.row]
        label.sizeToFit()
        label.frame = CGRect(x: 5, y: 0, width: label.frame.width, height:label.frame.height)
        if indexPath.row == 0{
            return CGSize(width: label.frame.width + 85, height: 45)
        }
        return CGSize(width: label.frame.width + 35, height: 45)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        // give space top left bottom and right for cells
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    //MARK: - Rows
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.shopDetailsCategoryArray.count
    }
    
    //MARK: - Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "clvShopDetailsCategoryCell", for: indexPath) as! clvShopDetailsCategoryCell
            cell.lblCategory.text = self.shopDetailsCategoryArray[indexPath.row]
            cell.flag = ( indexPath.item == clvIndexValue ? true : false)
            cell.imgCategoryBottom.alpha = (cell.flag ? 1 : 0)
            Helper.cornerSetView(view: cell.viewCategory, radiousValue: 10.0)
            Helper.borderAndborderColourSetUIView(view: cell.viewCategory, borderWidth: 1.0, colour: Helper.colorFromHexString(hex: "#707070"))
            if indexPath.row == 0{
                cell.viewCategory.isHidden = false
                cell.lblProductCount.isHidden = false
                cell.viewCategoryWidth.constant = 50
            }else{
                cell.viewCategory.isHidden = true
                cell.lblProductCount.isHidden = true
                cell.viewCategoryWidth.constant = 0
            }
        return cell
    }
    
    //MARK: - Cell Selection
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.clvIndexValue = indexPath.item
        self.clvShopDetailsCategory.reloadData()
        self.clvShopDetailsCategory.scrollToItem(at: [0,clvIndexValue], at: .centeredHorizontally, animated: true)
        self.tblShopDetailsReload(indexValue: clvIndexValue)
    }
}

//MARK: - TableView Logic
extension ShopDetailsVC:  UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch valueFrom {
            case .Products:
                return 3
            case .Services:
                return imgServicesArray.count
            case .About:
                return 1
            case .Reviews:
                return 6
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch valueFrom {
        
            case .Products:
                
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsProductSearchCell") as! tblShopDetailsProductSearchCell
                    cell.selectionStyle = .none
                    return cell
                    
                } else if indexPath.row == 1 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsProductCategoriesCell") as! tblShopDetailsProductCategoriesCell
                    cell.selectionStyle = .none
                    cell.awakeFromNib()
                    return cell
                    
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsProductCells") as! tblShopDetailsProductCells
                    cell.selectionStyle = .none
                    cell.awakeFromNib()
                    return cell
                }
                
            case .Services:
                
                let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsServicesCell") as! tblShopDetailsServicesCell
                cell.selectionStyle = .none
                cell.imgService.image = UIImage(named: imgServicesArray[indexPath.row])
                return cell
                
            case .About:
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsAboutCell") as! tblShopDetailsAboutCell
                cell.selectionStyle = .none
                cell.awakeFromNib()
                cell.lblDescription.text = "Nullam laoreet nunc sed velit porttitor, suscipit eleifend neque interdum. Proin molestie pulvinar lobortis. Donec tristique dictum nunc quis tincidunt. Vivamus facilisis metus mauris, ac porttitor orci porta ac. Mauris feugiat magna ex, eu egestas felis aliquam sit amet. Fusce dapibus euismod pretium. Nullam consectetur non augue et feugiat. Fusce ultrices ex ut ex cursus, sed interdum metus luctus. Etiam ultricies, felis vel scelerisque lacinia, nibh justo dapibus arcu, rutrum tristique eros tellus id dolor. Cras vitae commodo velit, quis aliquam enim. Suspendisse potenti. Donec at pellentesque nibh, ac varius erat. "
                cell.lblLocation.text = "Alummoottil Enterprise Pullad"
                cell.lblEmail.text = "johnsoncijo@gmail.com"
                cell.lblMobileNumber.text = "7510560337"
                return cell
                
            case .Reviews:
                
                if indexPath.row == 0 {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsReviewsHeaderCell") as! tblShopDetailsReviewsHeaderCell
                    cell.selectionStyle = .none
                    cell.awakeFromNib()
                    cell.ratingView.rating = 4.2
                    cell.lblAverageRating.text = "4.2"
                    cell.lblRatingSummary.text = "430 ratings and 88 reviews"
                    return cell
                    
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "tblShopDetailsReviewsDataCell") as! tblShopDetailsReviewsDataCell
                    cell.selectionStyle = .none
                    cell.awakeFromNib()
                    cell.ratingView.rating = 4.0
                    cell.lblReviewTitle.text = "Does the job"
                    cell.lblReview.text = "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of"
                    cell.lblName.text = "Ashwani Sharma"
                    return cell
                }
            
        }
        
    }
    
    //MARK: - Table Height Settings
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch valueFrom {
        
            case .Products:
                if indexPath.row == 0 {
                     return 69
                } else if indexPath.row == 1 {
                     return 75
                } else{
                     return UITableView.automaticDimension
                }
                
            case .Services:
                return 286.0
                
            case .About:
                return UITableView.automaticDimension
                
            case .Reviews:
                if indexPath.row == 0 {
                    return 100.0
                } else {
                    return UITableView.automaticDimension
                }
                
        }

    }
    
    //MARK: - Table Cell Selection
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch valueFrom {
        
            case .Products:
                break
                
            case .Services:
                let storyBoard = UIStoryboard(name: "ServiceDetails", bundle: nil)
                let controller = storyBoard.instantiateViewController(withIdentifier: "ServiceDetailsVC") as! ServiceDetailsVC
                self.navigationController?.pushViewController(controller, animated: true)
                
            case .About:
                break
                
            case .Reviews:
                break
                
        }
        
    }
}
