//
//  QuakeDetailView.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/19/22.
//

import UIKit

class QuakeDetailView: UIView {
    
    private lazy var locationLabel = QuakeLabel(fontSize: 25, fontWeight: .regular, textColor: .systemBackground)
    private lazy var quakeNameLabel = QuakeLabel(fontSize: 20, fontWeight: .bold, textColor: .systemBackground)
    private lazy var timeLabel = QuakeLabel(fontSize: 25, fontWeight: .light, textColor: .systemBackground)
    private lazy var quakeDatelabel = QuakeLabel(fontSize: 20, fontWeight: .medium, textColor: .systemBackground)
    private lazy var quakeDepthLabel = QuakeLabel(fontSize: 25, fontWeight: .regular, textColor: .systemBackground)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setDetail()
        setupUI()
    }
    
    private func setDetail() {
        backgroundColor = Constants.Style.Color.detailBackground
        layer.cornerRadius = 15
    }
    
    public func setupTexts(with mainModel : MainModel) {
        locationLabel.text = "Location:"
        quakeNameLabel.text = mainModel.title
        timeLabel.text = "Time"
        quakeDatelabel.text = mainModel.date
        quakeDepthLabel.text = "Quake Depth: \(mainModel.depth)"
    }
    
    private func setupUI() {
        let padding : CGFloat = 20
        addSubviews(locationLabel , quakeNameLabel , timeLabel , quakeDatelabel , quakeDepthLabel)
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            
            quakeNameLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: padding),
            quakeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            quakeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            
            
            timeLabel.topAnchor.constraint(equalTo: quakeNameLabel.bottomAnchor, constant: padding),
            timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: padding),
            
            
            quakeDatelabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: padding),
            quakeDatelabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            quakeDatelabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
            
            quakeDepthLabel.topAnchor.constraint(equalTo: quakeDatelabel.bottomAnchor, constant: padding),
            quakeDepthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
            quakeDepthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding)
            
        
        ])
    }
    

}
