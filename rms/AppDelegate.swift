//
//  AppDelegate.swift
//  rms
//
//  Created by Laura Artiles on 4/14/17.
//  Copyright © 2017 Laura Artiles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    window = UIWindow(frame: UIScreen.main.bounds)
    guard let window = window else {
        return false
    }
    let rootViewController = UITabBarController()
    rootViewController.tabBar.itemPositioning = .fill
    let ridesViewController = RidesViewController()
    ridesViewController.tabBarItem.title = "Rides"
    let leaderboardViewController = LeaderboardViewController()
    leaderboardViewController.tabBarItem.title = "Leaderboard"
    rootViewController.viewControllers = [ridesViewController, leaderboardViewController]
    window.rootViewController = rootViewController
    window.makeKeyAndVisible()


    UINavigationBar.appearance().barTintColor = UIColor(red:0.98, green:0.65, blue:0.26, alpha:1.0)
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    return true
  }
}

