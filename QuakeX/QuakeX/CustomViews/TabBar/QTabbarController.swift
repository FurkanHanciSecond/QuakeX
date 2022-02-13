//
//  QTabbarController.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class QTabbarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
        setTabs()
    }
    
    private func configTabBar() {
        tabBar.tintColor = Constants.Style.Color.lightGray
    }
    
    private func setTabs() {
        viewControllers = [
            quakeListVC(),
            emergencyContactVC(),
            settingsVC()
        ]
    }
    
    private func quakeListVC() -> UINavigationController {
        let quakeListViewController = QuakesViewController()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.quakes, image: Constants.Style.Image.quakes, tag: 0)
        
        quakeListViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: quakeListViewController)
    }
    
    private func emergencyContactVC() -> UINavigationController {
        let emergencyViewController = EmergencyContactVC()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.emergencyContacts, image: Constants.Style.Image.emergencyContacts, tag: 1)
        emergencyViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: emergencyViewController)
    }
    
    private func settingsVC() -> UINavigationController {
        let settingsViewController = SettingsVC()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.settings, image: Constants.Style.Image.settings, tag: 2)
        settingsViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: settingsViewController)
    }

    
    
}
