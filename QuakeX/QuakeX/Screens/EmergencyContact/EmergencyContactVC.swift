//
//  EmergencyPeopleVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class EmergencyContactVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        configureView()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .done, target: self, action: #selector(handlePlusButton(_:)))
        navigationItem.rightBarButtonItem = addButton

    }
    
    @objc private func handlePlusButton(_ sender: UIButton) {
        present(AddNewContactVC(), animated: true, completion: nil)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        self.title = Constants.Text.Bar.emergencyContacts
    }

}
