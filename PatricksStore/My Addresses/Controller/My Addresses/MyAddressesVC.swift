//
//  MyAddressesVC.swift
//  PatricksStore
//
//  Created by Faheem Hussain on 23/09/21.
//
import UIKit

class MyAddressesVC: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var bttnBack: UIButton!
    
    @IBOutlet weak var bttnAddNewAddress: UIButton!
    
    @IBOutlet weak var tblMyAddresses: UITableView!
    
    @IBOutlet weak var lblNoData: UILabel!
    
    //MARK: - Variables and Constants
    var viewModel = MyAddressViewModel()
    
    var myAddressData : MyAddressData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //API CALL
        checkConnectivityListAddressAPI()
    }
    
    // MARK: - Initial Setup
    func initialSetup() {
        
        // Set status bar color
        Helper.StatusBarColor(view: self.view)
        
        // Table Separator Setting
        self.tblMyAddresses.separatorStyle = .none
        
        //Hidden the noData Label
        lblNoData.isHidden = true
        
    }
    
    //MARK: - Button Actions
    
    // Back Button Action
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    // Add New Address Button Action
    @IBAction func addNewAddressButtonTapped(_ sender: UIButton) {
        let sty = UIStoryboard(name: "MyAddresses", bundle: nil)
        let vc = sty.instantiateViewController(withIdentifier: "AddAddressVC") as! AddAddressVC
        vc.buttonAddress = .Add
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: - Tableview Cell Button Delegates
    
    //MARK: -  Tableview Edit Button Action
    @IBAction func editBtnAction(_ sender: Any) {
        let selectedBtn = sender as! UIButton
        let buttonPostion = selectedBtn.convert(selectedBtn.bounds.origin, to: self.tblMyAddresses)
        if let indexPath = self.tblMyAddresses.indexPathForRow(at: buttonPostion) {
            let sty = UIStoryboard(name: "MyAddresses", bundle: nil)
            let vc = sty.instantiateViewController(withIdentifier: "AddAddressVC") as! AddAddressVC
            vc.buttonAddress = .Edit
            vc.addressId = self.myAddressData?.items?[indexPath.row].id
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK: -  Tableview Delete Button Action
    @IBAction func deleteBtnAction(_ sender: Any) {
        let selectedBtn = sender as! UIButton
        let buttonPostion = selectedBtn.convert(selectedBtn.bounds.origin, to: self.tblMyAddresses)
        if let indexPath = self.tblMyAddresses.indexPathForRow(at: buttonPostion) {
            checkConnectivityDeleteAddressAPI(addressId: (self.myAddressData?.items?[indexPath.row].id)!)
        }
    }
}

// MARK: - Tableview Logic
extension MyAddressesVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.myAddressData?.items != nil{
            return self.myAddressData!.items!.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 196
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblMyAddressesCell", for: indexPath) as! tblMyAddressesCell
        cell.selectionStyle = .none
        cell.bttnDelete.tag = indexPath.row
        cell.bttnEdit.tag = indexPath.row
        cell.itemDetails = self.myAddressData?.items![indexPath.row]
        cell.awakeFromNib()
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
 //MARK:- API CALL
extension MyAddressesVC{
    //MARK:- Listing Address API CALL
    func checkConnectivityListAddressAPI() {
        if Helper.checkInternetConnectivity() {
            viewModel.ListAddressAPI { (result) in
                self.myAddressData = result
                DispatchQueue.main.async {
                    self.tblMyAddresses.reloadData()
                    if self.myAddressData?.items?.count == 0{
                        self.lblNoData.isHidden = false
                    }else{
                        self.lblNoData.isHidden = true
                    }
                }
            }
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
    
    //MARK:- Delete Address API CALL
    func checkConnectivityDeleteAddressAPI(addressId:String) {
        if Helper.checkInternetConnectivity() {
            viewModel.DeleteAddressAPI(addressId: addressId) { (result) in
                DispatchQueue.main.async {
                    self.checkConnectivityListAddressAPI()
                    Helper.showAlert(message: result.msg!)
                }
            }
        } else {
            Helper.showAlert(message: "Please check your Internet connection")
        }
    }
}
