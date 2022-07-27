//
//  UIView+Extensions.swift
//  VFECommerce
//
//  Created by Renjithnath on 27/09/21.
//

import UIKit.UIView

//extension UIView {
//   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//}

extension UIView {
    
    func setThemeGradient(startColor: UIColor, endColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [startColor, endColor].compactMap { $0 }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.39)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.39)
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.layoutIfNeeded()
    }
    
    func themeGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [ UIColor.white, UIColor.black ].compactMap { $0 }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.39)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.39)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
        }
        UIGraphicsEndImageContext()
        return gradientLayer
    }
    
    func addGradient(colors: [CGColor], startPoint: CGPoint, endPoint: CGPoint) {
        DispatchQueue.main.async {
            self.layer.sublayers?.forEach {
                if let gradLayer = $0 as? CAGradientLayer {
                    gradLayer.removeFromSuperlayer()
                }
            }
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = colors
            gradient.startPoint = startPoint
            gradient.endPoint = endPoint
            self.layer.insertSublayer(gradient, at: 0)
            self.layoutIfNeeded()
        }
    }
    
    func addThemeLeftToRightGradient(colors: [CGColor]) {
        self.layer.sublayers?.forEach {
            if let gradLayer = $0 as? CAGradientLayer {
                gradLayer.removeFromSuperlayer()
            }
        }
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0.0, y: 0.39)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.39)
        self.layer.insertSublayer(gradient, at: 0)
        self.layoutIfNeeded()
    }
    
    func addGradientBottumTop(startColor: UIColor, endColor: UIColor) {
        DispatchQueue.main.async {
            self.layer.sublayers?.forEach {
                if let gradLayer = $0 as? CAGradientLayer {
                    gradLayer.removeFromSuperlayer()
                }
            }
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: 0.0, y: 0.999)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.0)
            self.layer.insertSublayer(gradient, at: 0)
            self.layoutIfNeeded()
        }
    }
    
    func addGradientLeftToRight(startColor: UIColor, endColor: UIColor) {
        DispatchQueue.main.async {
            let gradient = CAGradientLayer()
            gradient.frame = self.bounds
            gradient.name = "gradLayer"
            gradient.colors = [startColor.cgColor, endColor.cgColor]
            gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
            gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
            self.layer.insertSublayer(gradient, at: 0)
            self.layoutIfNeeded()
        }
    }
    
    func themeGradientImage() -> UIImage? {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 46.0 / 255.0, green: 154.0 / 255.0, blue: 229.0 / 255.0, alpha: 1.0).cgColor,
            UIColor.black.cgColor
            ].compactMap { $0 }
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            gradientLayer.render(in: context)
        }
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext() ?? nil
        UIGraphicsEndImageContext()
        
        return gradientImage
    }
    
    func asImage() -> UIImage {
        if #available(iOS 10.0, *) {
            let renderer = UIGraphicsImageRenderer(bounds: bounds)
            return renderer.image { rendererContext in
                layer.render(in: rendererContext.cgContext)
            }
        } else {
            UIGraphicsBeginImageContext(self.frame.size)
            self.layer.render(in:UIGraphicsGetCurrentContext()!)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return UIImage(cgImage: image!.cgImage!)
        }
    }
    
    func roundCorner(radius: CGFloat = 1.0) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
        self.clipsToBounds = true

    }
    
    func makeBorder(width: CGFloat = 1.0, color: UIColor = UIColor.clear) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
    }
}


extension UIView {
    func addRoundedShadow() {
        //        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //        self.layer.shadowRadius = 1
        //        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        //        self.layer.shadowOpacity = 0.5
        
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 3
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.masksToBounds = true
        
        self.layer.shadowOpacity = 0.18
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
        
    }
    
    func dropShadow(color: UIColor, opacity: Float = 0.25, offSet: CGSize, radius: CGFloat = 2, scale: Bool = true) {
        layer.masksToBounds = false
        //self.clipsToBounds = true
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        self.layer.shadowOpacity = 0.85
        /*layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1*/
    }
    
    func addShadow(radius: CGFloat) {
        self.layer.cornerRadius = 10

        // border
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.clear.cgColor

        // shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = radius
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, radius: CGFloat, opacity: Float) {
        layer.masksToBounds = false
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        
        let backgroundCGColor = backgroundColor?.cgColor
        backgroundColor = nil
        layer.backgroundColor =  backgroundCGColor
    }
    
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        DispatchQueue.main.async {
            if #available(iOS 11.0, *) {
                self.clipsToBounds = true
                self.layer.cornerRadius = radius
                self.layer.maskedCorners = CACornerMask(rawValue: corners.rawValue)
            } else {
                let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
                let mask = CAShapeLayer()
                mask.path = path.cgPath
                self.layer.mask = mask
            }
        }
    }
    
    func addBlur() {
        if !UIAccessibility.isReduceTransparencyEnabled {

            let blurEffect = UIBlurEffect(style: .prominent)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            //always fill the view
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

            self.insertSubview(blurEffectView, at: 0)  //if you have more UIViews, use an insertSubview API to place it where needed
        } else {
            //view.backgroundColor = .black
        }
    }
    
    func addBottomRoundedEdge() {
        let offset: CGFloat = (self.frame.width * 1.5)
        let bounds: CGRect = self.bounds

        let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width , height: bounds.size.height / 2)
        let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
        let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset , height: bounds.size.height)
        let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)

        let maskLayer: CAShapeLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath

        self.layer.mask = maskLayer
    }

     func updateMask() {
        let path = UIBezierPath()
        path.move(to: bounds.origin)
        let center = CGPoint(x: bounds.origin.x, y: bounds.origin.y + bounds.height/2)
        path.addArc(withCenter: center, radius: 10, startAngle: .pi, endAngle: 0, clockwise: false)
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.minY))
        path.addLine(to: CGPoint(x: bounds.maxX, y: bounds.maxY))
        path.addLine(to: CGPoint(x: bounds.minX, y: bounds.maxY))
        path.close()

        let mask = CAShapeLayer()
        mask.path = path.cgPath

        layer.mask = mask
    }
}
