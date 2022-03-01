//
//  SettingsVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        configureView()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        self.title = Constants.Text.Bar.settings
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}
