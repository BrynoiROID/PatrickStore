//
//  AppDelegate.swift
//  PatricksStore
//
//  Created by Admin on 17/08/21.
//

import UIKit

import IQKeyboardManagerSwift

import GoogleMaps

import GooglePlaces
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // LaunchScreen Delay
        Thread.sleep(forTimeInterval: 2.0)
        
        // To enable IQKeyboardManager
        IQKeyboardManager.shared.enable = true
        
        // Google Maps configuration
        GMSServices.provideAPIKey(Helper.GoogleMapServiceAPIKey)
        GMSPlacesClient.provideAPIKey(Helper.GoogleMapServiceAPIKey)
        
        // Initial Setup
        if #available(iOS 13, *) {
            // To run on iOS 13 and above versions
            
        } else {
            initialSetup()
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func initialSetup() {
        let StoryBoard = UIStoryboard.init(name: "Login", bundle: nil)
        let viewController = StoryBoard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.navigationBar.isHidden = true
        navigationController.interactivePopGestureRecognizer?.delegate = viewController
        navigationController.interactivePopGestureRecognizer?.isEnabled = false
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }

}

