//
//  QuakesDetailVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit
import MapKit
import CoreLocation
class QuakesDetailVC: UIViewController {
    
    public var viewModel : QuakeDetailViewModel {
        didSet {
            setup()
        }
    }
    
    private lazy var quakeDetailMapView : MKMapView = {
       let mapView = MKMapView()
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        return mapView
    }()
    
    private let coordinate = CLLocationCoordinate2D(latitude: 38.335692, longitude: 38.254197)

    
    private lazy var detailView = QuakeDetailView()
    
    init(mainModel : MainModel) {
        self.viewModel = QuakeDetailViewModel(mainModel: mainModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        detailView.setupTexts(with: viewModel.quakes ?? viewModel.quakes.unsafelyUnwrapped)
        
    }
    
    private func addPin() {
        let pin = MKPointAnnotation()
        pin.coordinate = coordinate
        pin.title = "Quake Is Here!!"
        pin.subtitle = "Quake Is Here!!"
        quakeDetailMapView.addAnnotation(pin)
        let region = MKCoordinateRegion(center: pin.coordinate, latitudinalMeters: 200, longitudinalMeters: 200)
        quakeDetailMapView.setRegion(region, animated: true)

    }
    
    private func getDetailInfo() {
        viewModel.getData {
            
        } errorContent: { err in
            AlertManager.showAlert(message: err.rawValue, viewController: self)
        }

    }
    
    private func setup() {
        configureBackground()
        setupDetailView()
        configureUploadButton()
        setupMapDelegate()
    }
    
    private func configureBackground() {
        view.backgroundColor = viewModel.viewBackground
    }
    
    private func setupMapDelegate() {
        quakeDetailMapView.delegate = self
    }
    
    private func configureUploadButton() {
        let uploadButton = UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"), style: .plain, target: self, action: #selector(uploadButton(_:)))
        
        navigationItem.rightBarButtonItem = uploadButton
}
    
    @objc private func uploadButton(_ sender : UIButton) {
        let text = "Hey you should definitely see this quake \(viewModel.quakes?.title) and time \(viewModel.quakes?.date)"
        let textShare = [text]
        let activityController = UIActivityViewController(activityItems: textShare, applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = self.view
        activityController.excludedActivityTypes = [UIActivity.ActivityType.airDrop , UIActivity.ActivityType.mail , UIActivity.ActivityType.postToTwitter ]
        
        self.present(activityController, animated: true, completion: nil)
    }
    
    private func setupDetailView() {
        let viewHeight : CGFloat = 270
        let padding : CGFloat = 25
       // detailView.dropShadow()
        view.addSubviews(detailView , quakeDetailMapView)
        
        detailView.translatesAutoresizingMaskIntoConstraints = false
        quakeDetailMapView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            quakeDetailMapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            quakeDetailMapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            quakeDetailMapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quakeDetailMapView.heightAnchor.constraint(equalToConstant: 150),
            
            detailView.topAnchor.constraint(equalTo: quakeDetailMapView.bottomAnchor, constant: padding),
            detailView.heightAnchor.constraint(equalToConstant: viewHeight),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)

        ])
    }
}


extension QuakesDetailVC : MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var pinView = quakeDetailMapView.dequeueReusableAnnotationView(withIdentifier: Constants.mapReuse) as? MKMarkerAnnotationView
        
        switch pinView {
        case nil:
            pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: Constants.mapReuse)
            pinView?.canShowCallout = true
            pinView?.animatesWhenAdded = true
            pinView?.glyphImage = UIImage(systemName: "pencil")
            
        default:
            pinView?.annotation = annotation
        }
        
        return pinView
    }
}
