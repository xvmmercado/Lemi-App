//
//  AppDelegate.swift
//  Lemi-App
//
//  Created by Xander Mercado on 3/19/20.
//  Copyright © 2020 Xander Mercado. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    lazy var dashboardController = DisplayDashboardViewController()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.showDashboard()
        return true
    }
    
    fileprivate func showDashboard() {
        DispatchQueue.main.async {
            self.window?.rootViewController = UINavigationController(rootViewController: self.dashboardController)
        }
    }
}

