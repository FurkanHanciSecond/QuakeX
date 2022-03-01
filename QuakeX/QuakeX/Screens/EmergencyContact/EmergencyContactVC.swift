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
    
    private var contacts : [EmergencyContact]?
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        refreshTableView()
    }
    
    private func setup() {
        configureView()
        setupNavigationBar()
        configureTableView()
        fetchContacts()
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
    
    private func refreshTableView() {
        self.emergencyTableView.refreshControl = UIRefreshControl()
        
        if let refreshControl = emergencyTableView.refreshControl {
            refreshControl.tintColor = .gray
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
            
        }
    }
    
    
    @objc private func refresh(_ sender : UIRefreshControl) {
        self.emergencyTableView.refreshControl?.beginRefreshing()
        self.emergencyTableView.refreshControl?.endRefreshing()
        self.emergencyTableView.reloadData()
        self.fetchContacts()
        
    }
    
    
    private func fetchContacts() {
        do {
            self.contacts = try context.fetch(EmergencyContact.fetchRequest())
            DispatchQueue.main.async {
                self.emergencyTableView.reloadData()
            }
        } catch  {
            AlertManager.showAlert(message: QuakeError.coreDataError.rawValue, viewController: self)
        }
    }
    
}


extension EmergencyContactVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .destructive, title: "Delete Contact") { action, view, handler in
            let eventRemove = self.contacts?[indexPath.row]
            self.context.delete(eventRemove ?? eventRemove.unsafelyUnwrapped)
            do {
                try self.context.save()
            } catch {
                AlertManager.showAlert(title: Constants.Text.Error.oops, message: QuakeError.dataError.rawValue, alertAction: nil, viewController: self)
                
            }
            
            self.fetchContacts()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contactNumber = "545 592 29 17"
        guard let number = URL(string: "tel://" + contactNumber) else { return }
        UIApplication.shared.open(number)
    }
}




extension EmergencyContactVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // return contacts?.count ?? 0
        return contacts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = emergencyTableView.dequeueReusableCell(withIdentifier: Constants.emergencyCellID, for: indexPath) as! EmergencyTableViewCell
        let emergencyContacts = self.contacts?[indexPath.row]
        
        cell.setCell(data: emergencyContacts)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
