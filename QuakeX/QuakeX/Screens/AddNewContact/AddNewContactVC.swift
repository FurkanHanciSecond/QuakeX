//
//  AddNewContactVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class AddNewContactVC: UIViewController {
    private lazy var processLabel = QuakeLabel(fontSize: 25, fontWeight: .medium, textColor: .systemBackground)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()

    }
    
    private func setup() {
        configureProcessLabel()
    }
    
    private func configureProcessLabel() {
        view.addSubview(processLabel)
        processLabel.text = "Still In Development :D"
        
        NSLayoutConstraint.activate([
            processLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            processLabel.trailingAnchor.constraint(equalTo:  view.trailingAnchor, constant: -20),
            
        ])
    }

}
