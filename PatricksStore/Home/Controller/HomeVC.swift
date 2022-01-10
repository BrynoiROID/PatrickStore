//
//  HomeVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 30/12/21.
//

import UIKit

import SideMenu

class HomeVC: UIViewController {

    //MARK: - IB Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    @IBOutlet weak var homeTableViewHeight: NSLayoutConstraint!
    //MARK: - Variables and Constants
    var categoryNamesArray = ["All Categories","Festival Offers","Daily Deals","Wholesale Market"]
    
    var categoryImagesArray = ["shop","christmas-tree","handshake","groceries"]
    
    var viewModel = HomeViewModel()
    
    var homeModel : HomeModel?
    
    var serviceCategoryModel = [ServiceCategoryData]()
    
    var productCategoryModel = [ProductCategoryData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initialSetup()
        self.sideMenuSetup()
    }
    //MARK: - Initial Setup
    func initialSetup() {
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        // Search Bar Settings
        if #available(iOS 13.0, *) {
            self.searchBar.updateHeight(height: 45.0)
            self.searchBar.searchBarStyle = .minimal
            self.searchBar.searchTextField.backgroundColor = .white
            self.searchBar.searchTextField.borderStyle = .none
            self.searchBar.searchTextField.layer.cornerRadius = 16
            self.searchBar.placeholder = "Search for Products, Shop, Brands & more"
            self.searchBar.searchTextField.font = UIFont(name: "Barlow-Regular", size: 15)
            self.searchBar.searchTextField.textColor = Helper.colorFromHexString(hex: "#343434")
        }else {
            // Fallback on earlier versions
            self.searchBar.clearBackgroundColor()
        }
        // Collection View Layout
        categoryCollectionView.collectionViewLayout = FourCustomCellLayoutHorizontal()
        // TableView Height and Seperation Setting
        self.homeTableView.separatorStyle = .none
        self.homeTableView.addObserver(self, forKeyPath: "contentSize", options: NSKeyValueObservingOptions.new, context: nil)
        self.homeTableView.rowHeight = UITableView.automaticDimension
        self.homeTableView.estimatedRowHeight = 40
        
        self.homeTableView.register(UINib(nibName: "bannerTableCell", bundle: nil), forCellReuseIdentifier: "bannerTableCell")
        self.homeTableView.register(UINib(nibName: "TittleTableCell", bundle: nil), forCellReuseIdentifier: "TittleTableCell")
        //API Calling
        self.checkConnectivityHomeData()
    }
    //MARK: - Side Menu Setup
    func sideMenuSetup() {
        let stry = UIStoryboard(name: "Home", bundle: nil)
        let menu = stry.instantiateViewController(withIdentifier: "SideMenuVC")
        let leftMenuNavigationController = SideMenuNavigationController(rootViewController: menu)
        SideMenuManager.default.leftMenuNavigationController = leftMenuNavigationController
        leftMenuNavigationController.presentationStyle = .menuSlideIn
        leftMenuNavigationController.leftSide = true
        leftMenuNavigationController.menuWidth = max(round(min((self.view.frame.size.width)-50, (self.view.frame.size.height)) * 1.0), 240)
        leftMenuNavigationController.presentDuration = 0.5
        leftMenuNavigationController.dismissDuration = 0.5
        leftMenuNavigationController.navigationBar.isHidden = true
        leftMenuNavigationController.statusBarEndAlpha = 0
    }
    //MARK: - TableView Height Settings
    override func viewDidLayoutSubviews() {
        self.resizeTableview()
    }
    func resizeTableview(){
        self.homeTableViewHeight.constant = self.homeTableView.contentSize.height
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.homeTableView.layer.removeAllAnimations()
        self.homeTableViewHeight.constant = self.homeTableView.contentSize.height
        UIView.animate(withDuration: 0.5) {
            self.homeTableView.updateConstraints()
        }
    }
    deinit{
        //self.homeTableView.removeObserver(self, forKeyPath: "contentSize")
    }
    //MARK: - Button Actions
    // Menu Button Action
    @IBAction func menuButtonTapped(_ sender: UIButton) {
        let menuVC = SideMenuManager.default.leftMenuNavigationController?.viewControllers.first as! SideMenuVC
        menuVC.serviceCategoryModel = self.serviceCategoryModel
        menuVC.productCategoryModel = self.productCategoryModel
        present(SideMenuManager.default.leftMenuNavigationController!, animated: true, completion: nil)
    }
    // Cart Button Action
    @IBAction func cartButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "MyCart", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "MyCartVC") as! MyCartVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    // Phone Button Action
    @IBAction func phoneButtonTapped(_ sender: UIButton) {
        Helper.showAlert(message: "Phone Button Tapped")
    }
    // Profile Button Action
    @IBAction func profileButtonTapped(_ sender: UIButton) {
        let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
        let controller = storyBoard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
//MARK: - Home Categories Collection View Logic
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryNamesArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        cell.awakeFromNib()
        cell.categoryLabel.text = categoryNamesArray[indexPath.item]
        cell.categoryImage.image = UIImage(named: categoryImagesArray[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let route = indexPath.item
            switch route {
                case 0:
                    let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                    let vc = strybd.instantiateViewController(withIdentifier: "AllCategoriesVC") as! AllCategoriesVC
                    self.navigationController?.pushViewController(vc, animated: true)
                case 1:
                    let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                    let vc = strybd.instantiateViewController(withIdentifier: "FestivalOffersVC") as! FestivalOffersVC
                    self.navigationController?.pushViewController(vc, animated: true)
                case 2:
                    let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                    let vc = strybd.instantiateViewController(withIdentifier: "DailyDealsVC") as! DailyDealsVC
                    self.navigationController?.pushViewController(vc, animated: true)
                case 3:
                    let strybd = UIStoryboard(name: "HomeCategories", bundle: nil)
                    let vc = strybd.instantiateViewController(withIdentifier: "WholeSaleMarketVC") as! WholeSaleMarketVC
                    self.navigationController?.pushViewController(vc, animated: true)
                default:
                    Helper.showAlert(message: "No Categories")
            }
    }
}
//MARK: - Home Table View Logic
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    //MARK: - Rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.homeModel?.data?.count ?? 0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.homeModel?.data?[indexPath.row].item == "banner"{
            return 170.0
        }else if self.homeModel?.data?[indexPath.row].item == "slider"{
            if self.homeModel?.data?[indexPath.row].title == ""{
                return 120.0
            }else{
                return UITableView.automaticDimension
            }
        }else if self.homeModel?.data?[indexPath.row].item == "shop"{
            return UITableView.automaticDimension
        }else if self.homeModel?.data?[indexPath.row].item == "productCategory"{
            return UITableView.automaticDimension
        }else{
            return 0
        }
    }
    //MARK: - Cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let currentModel = self.homeModel?.data?[indexPath.row]
        if currentModel?.item == "banner"{
            if currentModel!.banner!.count > 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "bannerTableCell") as! bannerTableCell
                    cell.selectionStyle = .none
                    cell.bannerModel = currentModel!.banner!
                    cell.awakeFromNib()
                return cell
            }
        }else if currentModel?.item == "slider"{
            if currentModel?.title == ""{
                if currentModel!.slider!.count > 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sliderWithoutTittleTableCell") as! sliderWithoutTittleTableCell
                        cell.selectionStyle = .none
                        cell.sliderModel = currentModel!.slider!
                        cell.awakeFromNib()
                    return cell
                }
            }else{
                if currentModel!.slider!.count > 0{
                    let cell = tableView.dequeueReusableCell(withIdentifier: "sliderWithTittleTableCell") as! sliderWithTittleTableCell
                        cell.selectionStyle = .none
                        cell.tittleLabel.text = currentModel?.title
                        cell.sliderModel = currentModel!.slider!
                        cell.layoutIfNeeded()
                        cell.awakeFromNib()
                    return cell
                }
            }
        }else if self.homeModel?.data?[index].item == "shop"{
            if currentModel!.shop!.count > 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "commonCategoryProductTableCell") as! commonCategoryProductTableCell
                    cell.selectionStyle = .none
                    cell.shopModel = currentModel!.shop!
                    cell.awakeFromNib()
                return cell
            }
        }else if self.homeModel?.data?[index].item == "productCategory"{
            if currentModel!.productCategory!.count > 0{
                let cell = tableView.dequeueReusableCell(withIdentifier: "CommonProductTableCell") as! CommonProductTableCell
                    cell.selectionStyle = .none
                    cell.productCategoryModel  = currentModel!.productCategory!
                    cell.awakeFromNib()
                return cell
            }
        }
        return UITableViewCell()
    }
}
//MARK: - API Call
extension HomeVC {
    //MARK: - Dashboard API
    func checkConnectivityHomeData() {
        if Helper.checkInternetConnectivity() {
            viewModel.HomeDataFetchAPI(latitude:"",longitude: "",completion: { [self](result) in
                self.homeModel = result
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                    self.checkConnectivityServiceData()
                }
            })
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    //MARK: - SideMenu Service Category API
    func checkConnectivityServiceData(){
        if Helper.checkInternetConnectivity() {
            viewModel.ServiceDataFetchAPI(completion: { [self](result) in
                self.serviceCategoryModel = result.data!
                DispatchQueue.main.async {
                    self.checkConnectivityProductData()
                }
            })
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    //MARK: - SideMenu Product Category API
    func checkConnectivityProductData(){
        if Helper.checkInternetConnectivity() {
            viewModel.ProductDataFetchAPI(completion: { [self](result) in
                self.productCategoryModel = result.data!
                DispatchQueue.main.async {
                }
            })
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}


