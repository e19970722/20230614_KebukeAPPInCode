//
//  AppDelegate.swift
//  20230614_KebukeAPP_SnapKit
//
//  Created by Yen Lin on 2023/6/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //初始畫面 TabBarController
        let mainTabBarController = MainTabBarController()
        mainTabBarController.tabBar.barTintColor = appBackgroundColor
        
        //設定有2個Tab
        let mainNavigationController = MainNavigationController()
        let secondaryNavigationController = SecondaryNavigationController()
        
        //NavigationController
        mainNavigationController.title = "首頁"
        mainNavigationController.tabBarItem.image = UIImage(systemName: "house.fill")
        secondaryNavigationController.title = "訂單"
        secondaryNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.clipboard.fill")
        
        mainNavigationController.navigationBar.barTintColor = appBackgroundColor
        secondaryNavigationController.navigationBar.barTintColor = appBackgroundColor
        
        mainNavigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        secondaryNavigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]

        mainTabBarController.viewControllers = [mainNavigationController, secondaryNavigationController]
        
        
        
        
        
        //CollectionViewController
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let mainCollectionViewController = MainCollectionViewController(collectionViewLayout: layout)
        mainNavigationController.viewControllers = [mainCollectionViewController]
        
        
        
        //SecondaryViewController
        let secondaryTableViewController = SecondaryTableViewController()
        secondaryNavigationController.viewControllers = [secondaryTableViewController]
        
        
        
        
        //把上述畫面顯示出來
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //Global Tintcolor
        window?.tintColor = appTintColor
        window?.backgroundColor = UIColor(cgColor: CGColor(red: 23/255, green: 61/255, blue: 80/255, alpha: 1))
        
        window?.makeKeyAndVisible()
        window?.rootViewController = mainTabBarController
        
        
        return true
    }


}

