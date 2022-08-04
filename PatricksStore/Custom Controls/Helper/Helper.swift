//
//  Helper.swift
//  HealthyFood
//
//  Created by Admin on 17/08/21.
//

import UIKit

import SkyFloatingLabelTextField

class Helper {
    
    //MARK: - App Specific Strings
    static var appName : String = "PATRICKS STORE"
    static var appBaseURL: String = "http://34.93.247.52:8000/"
    static var FCMToken: String = ""
    static var GoogleMapServiceAPIKey: String = "AIzaSyAsmkQ2ai4T-lK-P2fzNNM5iKjcU3qdhqE"
    //MARK: - App Colors
    static var appThemeColor: String = "#DDAB3A"
    static var appStatusBarColor: String = "#C78735"
    
    //MARK: - Colors for iOS 12
    static var systemGray5Equal: UIColor = UIColor(red: 0.90, green: 0.90, blue: 0.92, alpha: 1.00)
    
    //MARK: - Alert Message
    static func showAlert(message: String) {
        let alert = UIAlertController(title: appName, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIWindow.key?.rootViewController?.present(alert, animated: true, completion: nil)
     }
    
    //MARK: - Show Alert Message Over Modal
    static func showAlertOverModal(message: String) {
        let alert = UIAlertController(title: appName, message: message as String, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        if UIWindow.key?.rootViewController?.presentedViewController == nil {
            UIWindow.key?.rootViewController?.present(alert, animated: true, completion: nil)
        } else {
            UIWindow.key?.rootViewController?.presentedViewController!.present(alert, animated: true, completion: nil)
        }
     }
    
    //MARK: - Email Validation
    static func validateEmail(_ candidate: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: candidate)
    }
    
    //MARK: - Covert Hex Color to UIColor
    static func colorFromHexString (hex: String) -> UIColor {
               
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
                   
        if ((cString.count) != 6) {
            return UIColor.gray
        }
                   
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
                   
        return UIColor(
                       red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                       green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                       blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                       alpha: CGFloat(1.0)
                      )
     }
    
    //MARK: - Status Bar Colour
    static func StatusBarColor(view:UIView) {
         
        if #available(iOS 13.0, *) {
           let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
           let statusBarHeight = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
   
           let statusbarView = UIView()
           statusbarView.backgroundColor = self.colorFromHexString(hex: self.appStatusBarColor)
           view.addSubview(statusbarView)
                   
           statusbarView.translatesAutoresizingMaskIntoConstraints = false
           statusbarView.heightAnchor
                   .constraint(equalToConstant: statusBarHeight).isActive = true
           statusbarView.widthAnchor
                   .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
           statusbarView.topAnchor
                   .constraint(equalTo: view.topAnchor).isActive = true
           statusbarView.centerXAnchor
                   .constraint(equalTo: view.centerXAnchor).isActive = true
         } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = self.colorFromHexString(hex: self.appStatusBarColor)
         }
            
    }
    
    //MARK: - To check internet connectivity
    static func checkInternetConnectivity() -> Bool {
        do {
            let reachability = try Reachability()
            if reachability.connection != .unavailable {
                return true
            } else {
                return false
            }
        }
        catch let err {
            print(err)
        }
        return false
    }
    
    //MARK: - Setting User Defaults
    static func setLoggedinUser(loggedUser: OtpData) {
        let userDict:NSMutableDictionary = [:]
        var tokenValue = loggedUser.jwtToken
               tokenValue = "Bearer " + tokenValue!
               userDict.setValue(tokenValue, forKey: "jwtToken")
        userDict.setValue(loggedUser.imageUrl, forKey: "imageUrl")
               userDict.setValue(loggedUser.email, forKey: "email")
        userDict.setValue(loggedUser.firstName, forKey: "firstName")
        userDict.setValue(loggedUser.mobile, forKey: "mobile")
        userDict.setValue(loggedUser.lastName, forKey: "lastName")
               let userDef = UserDefaults.standard
               userDef.set(userDict, forKey: "loggedin_user")
               userDef.synchronize()
    }
    
    //MARK: - Logged In User Defaults
    static func getLoggedinUser() -> OtpData? {
        
        let user : OtpData?
        let userDef = UserDefaults.standard
        
        if (userDef.object(forKey: "loggedin_user") != nil){
            let userDict = userDef.object(forKey: "loggedin_user") as! NSDictionary
            user = OtpData(firstName: (userDict.object(forKey: "firstName") ?? "") as? String, lastName: (userDict.object(forKey: "lastName") ?? "") as? String, email: (userDict.object(forKey: "email") ?? "") as? String, mobile: (userDict.object(forKey: "mobile") ?? "") as? String, imageUrl: (userDict.object(forKey: "imageUrl") ?? "") as? String, jwtToken: (userDict.object(forKey: "jwtToken") ?? "") as? String)
            return user
        }
        
        return nil
    }
    
    //MARK: - Clear User Defaults
    static func clearUserDefaults() {
        let userDef = UserDefaults.standard
        userDef.removeObject(forKey: "loggedin_user")
        UserDefaults.standard.synchronize()
    }

    //MARK: - View Shadow
    static func shadoweSetView(view:UIView){
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
    }
    
    //MARK: - ImageView Shadow
    static func shadoweSetImageView(image:UIImageView){
        image.layer.shadowColor = UIColor.black.cgColor
        image.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        image.layer.shadowRadius = 4
        image.layer.shadowOpacity = 0.5
        image.layer.masksToBounds = false
    }
    //MARK: - Button Shadow
    static func shadoweSetButton(button:UIButton){
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.5
        button.layer.masksToBounds = false
    }
    // MARK: - For bottom shadow in UIView
    static func shadowSetViewBottom(view: UIView) {
        view.layer.masksToBounds = false
        view.layer.shadowRadius = 1
        view.layer.shadowOpacity = 0.5
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0 , height: 2)
    }
    
    // MARK: - For card style view in UIView
    static func shadowSetCardView(view: UIView) {
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = 3
        view.layer.shadowOpacity = 0.7
    }
    //MARK: - CornerRadious with Shadow View
    static func setCornerAndShadowSetView(view:UIView) {
        // corner radius
        view.layer.cornerRadius = 10
        // shadow
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowOpacity = 0.3
        view.layer.shadowRadius = 4.0
    }
    //MARK: - View Border and border Colour
    static func borderAndborderColourSetUIView(view:UIView,borderWidth:CGFloat,colour:UIColor){
            view.layer.borderWidth = borderWidth
            view.layer.borderColor = colour.cgColor
    }
    
    //MARK: - Button Border and border Colour
    static func borderAndborderColourSetUIButton(button:UIButton,borderWidth:CGFloat,colour:UIColor){
        button.layer.borderWidth = borderWidth
        button.layer.borderColor = colour.cgColor
    }
    //MARK: - ImageView Border and border Colour
    static func borderAndborderColourSetUIImageView(image:UIImageView,borderWidth:CGFloat,colour:UIColor){
        image.layer.borderWidth = borderWidth
        image.layer.borderColor = colour.cgColor
    }
    //MARK: - Corner Radius View
    static func cornerSetView(view:UIView,radiousValue:CGFloat){
        view.layer.cornerRadius = radiousValue
        view.layer.masksToBounds = true
    }
    
    //MARK: - Corner Radius ImageView
    static func cornerSetImageView(image:UIImageView,radiousValue:CGFloat){
        image.layer.cornerRadius = radiousValue
        image.layer.masksToBounds = true
    }
    
    //MARK: - Corner Radius Button
    static func cornerSetButton(button:UIButton,radiousValue:CGFloat){
        button.layer.cornerRadius = radiousValue
        button.layer.masksToBounds = true
    }
}

//MARK: - Extensions

//MARK: - Key Window
extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}

//MARK: - Prevent Navigation Gesture
extension UIViewController: UIGestureRecognizerDelegate{
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == self.navigationController?.interactivePopGestureRecognizer {
            return false
        } else {
            return true
        }
    }
}

//MARK: - Button Customizations
extension UIButton {
    // Make button rounded
    func makeRounded() {
        self.layer.cornerRadius = self.frame.height / 2.0
    }
}

//MARK: - UIView Customizations
extension UIView {
    // Makes the top corners of the view rounded
    func makeTopCornersRounded() {
        self.layer.cornerRadius = 40
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
}

//MARK: - Underline UILabel
extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}

//MARK: - Implement hide/unhide TextField
extension SkyFloatingLabelTextField {
    
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if isSecureTextEntry {
            button.setImage(UIImage(named: "visibility"), for: .normal)
        }else{
            button.setImage(UIImage(named: "visibility-hidden"), for: .normal)
        }
    }
    
    func enablePasswordToggle(){
        let button = UIButton(type: .custom)
        setPasswordToggleImage(button)
        button.frame = CGRect(x: 0, y: 0, width: 25.0, height: 25.0)
        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
        self.rightView = button
        self.rightViewMode = .always
    }

    
    @IBAction func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry.toggle()
        setPasswordToggleImage(sender as! UIButton)
    }
    
}

//MARK: - To modify the size of the UISearchBar
extension UISearchBar {
    func updateHeight(height: CGFloat, radius: CGFloat = 8.0) {
        let image: UIImage? = UIImage.imageWithColor(color: UIColor.clear, size: CGSize(width: 1, height: height))
        setSearchFieldBackgroundImage(image, for: .normal)
        for subview in self.subviews {
            for subSubViews in subview.subviews {
                if #available(iOS 13.0, *) {
                    for child in subSubViews.subviews {
                        if let textField = child as? UISearchTextField {
                            textField.layer.cornerRadius = radius
                            textField.clipsToBounds = true
                        }
                    }
                    continue
                }
                if let textField = subSubViews as? UITextField {
                    textField.layer.cornerRadius = radius
                    textField.clipsToBounds = true
                }
            }
        }
    }
}

//MARK: - Make Image to Color
extension UIImage {
    static func imageWithColor(color: UIColor, size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return nil
        }
        UIGraphicsEndImageContext()
        return image
    }
}

//MARK: - Strikethrough Label
extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
               value: NSUnderlineStyle.single.rawValue,
                   range:NSMakeRange(0,attributeString.length))
        return attributeString
    }
}

//MARK: - Underline Button
extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: self.titleColor(for: .normal)!, range: NSRange(location: 0, length: text.count))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        self.setAttributedTitle(attributedString, for: .normal)
    }
}

//MARK: - Dotted View
func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.strokeColor = UIColor.lightGray.cgColor
    shapeLayer.lineWidth = 1
    shapeLayer.lineDashPattern = [5, 2] // 7 is the length of dash, 3 is length of the gap.

    let path = CGMutablePath()
    path.addLines(between: [p0, p1])
    shapeLayer.path = path
    view.layer.addSublayer(shapeLayer)
}

//MARK: - Check if a string contains numbers only
extension String {
   var isNumeric: Bool {
     return !(self.isEmpty) && self.allSatisfy { $0.isNumber }
   }
}

//MARK: - Check if keyboard is present
extension UIApplication {
    var isKeyboardPresented: Bool {
        guard let keyboardWindowClass = NSClassFromString("UIRemoteKeyboardWindow") else { return false }
        return UIApplication.shared.windows.contains(where: { $0.isKind(of: keyboardWindowClass) })
    }
}

//MARK: - ImageView Image Color Change
extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }

}

//MARK: - To pop to a particular view controller
extension UINavigationController {
  func popToViewController(ofClass: AnyClass, animated: Bool = true) {
    if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
      popToViewController(vc, animated: animated)
    }
  }
}

//MARK: - To add border to a view
extension UIView {
    func addBorder(_ edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.backgroundColor = color
        self.addSubview(subview)
        switch edge {
        case .top, .bottom:
            subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .top {
                subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            } else {
                subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            }
        case .left, .right:
            subview.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
            subview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
            subview.widthAnchor.constraint(equalToConstant: thickness).isActive = true
            if edge == .left {
                subview.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
            } else {
                subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
            }
        default:
            break
        }
    }
}

//MARK: - To Customize UISearchBar
extension UISearchBar {
    public var textField: UITextField? {
        if #available(iOS 13, *) {
            return searchTextField
        }
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }

    func clearBackgroundColor() {
        guard let UISearchBarBackground: AnyClass = NSClassFromString("UISearchBarBackground") else { return }

        for view in subviews {
            for subview in view.subviews where subview.isKind(of: UISearchBarBackground) {
                subview.alpha = 0
            }
        }
    }

    public var activityIndicator: UIActivityIndicatorView? {
        return textField?.leftView?.subviews.compactMap { $0 as? UIActivityIndicatorView }.first
    }

    var isLoading: Bool {
        get {
            return activityIndicator != nil
        } set {
            if newValue {
                if activityIndicator == nil {
                    let newActivityIndicator = UIActivityIndicatorView(style: .gray)
                    newActivityIndicator.color = UIColor.gray
                    newActivityIndicator.startAnimating()
                    newActivityIndicator.backgroundColor = textField?.backgroundColor ?? UIColor.white
                    textField?.leftView?.addSubview(newActivityIndicator)
                    let leftViewSize = textField?.leftView?.frame.size ?? CGSize.zero

                    newActivityIndicator.center = CGPoint(x: leftViewSize.width - newActivityIndicator.frame.width / 2,
                                                          y: leftViewSize.height / 2)
                }
            } else {
                activityIndicator?.removeFromSuperview()
            }
        }
    }

    func changePlaceholderColor(_ color: UIColor) {
        guard let UISearchBarTextFieldLabel: AnyClass = NSClassFromString("UISearchBarTextFieldLabel"),
            let field = textField else {
            return
        }
        for subview in field.subviews where subview.isKind(of: UISearchBarTextFieldLabel) {
            (subview as! UILabel).textColor = color
        }
    }

    func setRightImage(normalImage: UIImage,
                       highLightedImage: UIImage) {
        showsBookmarkButton = true
        if let btn = textField?.rightView as? UIButton {
            btn.setImage(normalImage,
                         for: .normal)
            btn.setImage(highLightedImage,
                         for: .highlighted)
        }
    }
    
        func setLeftImage(_ image: UIImage,
                      with padding: CGFloat = 0,
                      tintColor: UIColor) {
        let imageView = UIImageView()
        imageView.image = image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.tintColor = tintColor

        if padding != 0 {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.alignment = .center
            stackView.distribution = .fill
            stackView.translatesAutoresizingMaskIntoConstraints = false
            
            let paddingView = UIView()
            paddingView.translatesAutoresizingMaskIntoConstraints = false
            paddingView.widthAnchor.constraint(equalToConstant: padding).isActive = true
            paddingView.heightAnchor.constraint(equalToConstant: padding).isActive = true
            stackView.addArrangedSubview(paddingView)
            stackView.addArrangedSubview(imageView)
            textField?.leftView = stackView

        } else {
            textField?.leftView = imageView
        }
    }
}

//MARK: - Make Image to Color
extension UIImage {
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage!)!)
    }
}
//MARK: -  Append Params with URL
extension URL {
    /// Returns a new URL by adding the query items, or nil if the URL doesn't support it.
    /// URL must conform to RFC 3986.
    func appending(_ queryItems: [URLQueryItem]) -> String? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            // URL is not conforming to RFC 3986 (maybe it is only conforming to RFC 1808, RFC 1738, and RFC 2732)
            return nil
        }
        // append the query items to the existing ones
        urlComponents.queryItems = (urlComponents.queryItems ?? []) + queryItems
        // return the url from new url components
        //return urlComponents.url
        return urlComponents.url!.absoluteString
    }
}


