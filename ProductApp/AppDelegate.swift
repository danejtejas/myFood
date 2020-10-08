//
//  AppDelegate.swift
//  ProductApp
//
//  Created by Tejas on 07/10/20.
//  Copyright © 2020 Tejas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    
   var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setNavigationTitle()
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    
    
    func setNavigationTitle() {
        
        
        
        let navBgColor : UIColor = .red
        let navTitleColor : UIColor = .white
        
        
        let titleFontAttrs = [ NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 18)!, NSAttributedString.Key.foregroundColor: navTitleColor ]
        let barButtonFontAttrs = [ NSAttributedString.Key.font: UIFont(name: "Futura-Bold", size: 15)! ]
        
        UINavigationBar.appearance().tintColor = UIColor.white // bar icons
        
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = navBgColor // If you want different nav background color other than white
            
    
            appearance.shadowImage = UIImage()
            
            
            appearance.titleTextAttributes = titleFontAttrs
            appearance.largeTitleTextAttributes = titleFontAttrs // If your app supports largeNavBarTitle
            
            UINavigationBar.appearance().isTranslucent = false
            
            appearance.buttonAppearance.normal.titleTextAttributes = barButtonFontAttrs
            appearance.buttonAppearance.highlighted.titleTextAttributes = barButtonFontAttrs
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().compactAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        } else {
            UINavigationBar.appearance().barTintColor = navBgColor // bar background
            UINavigationBar.appearance().shadowImage = UIImage()
            
            UINavigationBar.appearance().titleTextAttributes = titleFontAttrs
            
            UINavigationBar.appearance().isTranslucent = false
            
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonFontAttrs, for: .normal)
            UIBarButtonItem.appearance().setTitleTextAttributes(barButtonFontAttrs, for: .highlighted)
            
            
        }
        
    }
    
    
}

