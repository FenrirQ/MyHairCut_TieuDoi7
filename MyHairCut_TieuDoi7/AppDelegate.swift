//
//  AppDelegate.swift
//  MyHairCut_TieuDoi7
//
//  Created by Quang Ly Hoang on 10/29/16.
//  Copyright © 2016 FenrirQ. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var customizedLaunchScreenView: UIView?
    var custom : customLaunchScreen!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FIRApp.configure()
        // Override point for customization after application launch.
        var prefersStatusBarHidden: Bool {
            return true
        }
        
        // customized launch screen
            
            custom  = customLaunchScreen()
            customizedLaunchScreenView = UIView()
            customizedLaunchScreenView = custom.view
            self.window?.makeKeyAndVisible()
            self.window?.addSubview(self.customizedLaunchScreenView!)
            self.window?.bringSubview(toFront: self.customizedLaunchScreenView!)
            UIView.animate(withDuration: 1, delay: 2, options: .curveEaseOut,
                                       animations: { () -> Void in
                self.customizedLaunchScreenView?.alpha = 0
            },
                completion: { _ in
                self.customizedLaunchScreenView?.removeFromSuperview() })
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

