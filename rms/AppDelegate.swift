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
    let ridesViewController = RidesViewController()
    ridesViewController.tabBarItem = UITabBarItem(title: "Rides", image: #imageLiteral(resourceName: "bike"), tag: 0)
    let leaderboardViewController = LeaderboardViewController()
    leaderboardViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)

    let tabBarController = UITabBarController()
    tabBarController.tabBar.itemPositioning = .fill
    let tabs = [ridesViewController, leaderboardViewController]
    tabBarController.viewControllers = tabs.map { UINavigationController(rootViewController: $0) }
    window.rootViewController = tabBarController
    window.makeKeyAndVisible()


    UINavigationBar.appearance().barTintColor = UIColor(red:0.98, green:0.65, blue:0.26, alpha:1.0)
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
    return true
  }
}

