//
//  EmergencyPeopleVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class EmergencyContactVC: UIViewController {
    
    private lazy var emergencyTableView : UITableView = {
       let table = UITableView()
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        configureView()
        setupNavigationBar()
        configureTableView()
    }
    
    private func setupNavigationBar() {
        let addButton = UIBarButtonItem(image: UIImage(systemName: "plus.circle.fill"), style: .done, target: self, action: #selector(handlePlusButton(_:)))
        navigationItem.rightBarButtonItem = addButton

    }
    
    @objc private func handlePlusButton(_ sender: UIButton) {
        present(AddNewContactVC(), animated: true, completion: nil)
        //navigationController?.pushViewController(AddNewContactVC(), animated: true)
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        self.title = Constants.Text.Bar.emergencyContacts
    }
    
    private func setTableViewDelegate() {
        emergencyTableView.delegate = self
    }
    
    private func setTableViewDataSource() {
        emergencyTableView.dataSource = self
    }
    
    private func configureTableView() {
        setTableViewDelegate()
        setTableViewDataSource()
        view.addSubview(emergencyTableView)
        emergencyTableView.pinToEdges(of: view)        
        emergencyTableView.removeExcessCells()
        emergencyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "test")
    }

}


extension EmergencyContactVC : UITableViewDelegate {
    //TODO: 👇
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration()
    }
}

extension EmergencyContactVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Still In Development :D"
        
        return cell
    }
}
