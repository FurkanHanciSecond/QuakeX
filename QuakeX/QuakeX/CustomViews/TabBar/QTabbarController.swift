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
        tabBar.barTintColor = Constants.Style.Color.black
        tabBar.tintColor = Constants.Style.Color.red
        
    }
    
    private func setTabs() {
        viewControllers = [
            quakesVC(),
            emergencyContactVC(),
            settingsVC()
        ]
    }
    
    private func quakesVC() -> UINavigationController {
        let quakesViewController = QuakesViewController()
        let tabBarItem = UITabBarItem(title: Constants.Text.Bar.quakes, image: Constants.Style.Image.quakes, tag: 0)
        
        quakesViewController.tabBarItem = tabBarItem
        return UINavigationController(rootViewController: quakesViewController)
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
