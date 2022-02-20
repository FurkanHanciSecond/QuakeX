//
//  QuakesViewController.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class QuakesViewController: LoadingViewController {
    
    public var viewModel =  QuakesViewModel() {
        didSet {
            setup()
        }
    }
    
    private lazy var quakeTableView : UITableView = {
       let table = UITableView()
        
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getQuakes()
    }
    
    private func getQuakes() {
        showLoadingView()
        generateHaptic()
        viewModel.getQuakes { [weak self] in
            self?.quakeTableView.reloadDataOnMainThread()
            self?.dismissLoadingView()
        } errorContent: { err in
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }
    
    private func setup() {
        configureViewController()
        configureNavigationController()
        configureTableViewDelegate()
        configureTableViewDatasource()
        configureSearchBar()
        configureTableView()
        refreshTableView()
        setNotificationHelper()
    }
    
    private func setNotificationHelper() {
        NotificationHelper.shared.requestForPermission()
    }
    
    //TODO: Trick 
    private func generateHaptic() {
        let haptic = UINotificationFeedbackGenerator()
        haptic.notificationOccurred(.success)
    }
    
    private func configureSearchBar() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = true
        searchController.searchBar.text = viewModel.searchText
        navigationItem.searchController = searchController
    }
    
    private func refreshTableView() {
        self.quakeTableView.refreshControl = UIRefreshControl()
        
        if let refreshControl = quakeTableView.refreshControl {
            refreshControl.tintColor = .gray
            refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        }
    }
    
    @objc func refresh(_ sender : UIRefreshControl) {
        self.quakeTableView.refreshControl?.beginRefreshing()
        
        viewModel.getQuakes { [weak self] in
            self?.quakeTableView.refreshControl?.endRefreshing()
            self?.quakeTableView.reloadDataOnMainThread()
        } errorContent: { [weak self] err in
            self?.quakeTableView.refreshControl?.endRefreshing()
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }

    private func configureViewController() {
        view.backgroundColor = viewModel.viewBackground
    }
    
    private func configureNavigationController() {
        title = viewModel.title
    }
    
    private func configureTableView() {
        view.addSubview(quakeTableView)
        quakeTableView.pinToEdges(of: view)
        quakeTableView.separatorStyle = .none
        
        quakeTableView.removeExcessCells()
        quakeTableView.register(QuakesTableViewCell.self, forCellReuseIdentifier: Constants.cellID)
    }
    
    private func configureTableViewDelegate() {
        quakeTableView.delegate = self
    }
    
    private func configureTableViewDatasource() {
        quakeTableView.dataSource = self
    }
    
}


extension QuakesViewController : UITableViewDelegate {
    //TODO: Make Clickable
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quakes = viewModel.quakes?[indexPath.row]
        let quakeDetailViewController = QuakesDetailVC(mainModel: quakes ?? quakes.unsafelyUnwrapped)
        navigationController?.pushViewController(quakeDetailViewController, animated: true)
    }
}

extension QuakesViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.quakes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = quakeTableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath) as! QuakesTableViewCell
        let quake = viewModel.quakes?[indexPath.row]
        cell.set(data: quake ?? quake.unsafelyUnwrapped)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    
}


extension QuakesViewController : UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.filter = searchController.searchBar.text ?? ""
        
        quakeTableView.reloadDataOnMainThread()
        
        if viewModel.quakes == nil {
            showNoResultsViewOnTableView(with: viewModel.noResultsFound, on: quakeTableView)
        } else {
            quakeTableView.backgroundView = nil
        }
    }
}
