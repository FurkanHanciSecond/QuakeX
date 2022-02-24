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
        emergencyTableView.separatorStyle = .none
        emergencyTableView.register(EmergencyTableViewCell.self, forCellReuseIdentifier: Constants.emergencyCellID)
    }

}


extension EmergencyContactVC : UITableViewDelegate {
    //TODO: 👇
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = "5469327550"
        guard let number = URL(string: "tel://" + number) else { return }
        UIApplication.shared.open(number)
    }
}

extension EmergencyContactVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emergencyTableView.dequeueReusableCell(withIdentifier: Constants.emergencyCellID, for: indexPath) as! EmergencyTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
