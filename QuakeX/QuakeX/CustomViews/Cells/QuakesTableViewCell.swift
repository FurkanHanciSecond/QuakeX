//
//  QuakesTableViewCell.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit

class QuakesTableViewCell: UITableViewCell {
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.backgroundColor = Constants.Style.Color.cellBackground
        view.addBorder()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var arrowRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = Constants.Style.Color.black
        imageView.image = Constants.Style.Image.arrowRight
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var locationLabel = QuakeLabel(fontSize: 20, fontWeight: .light , textColor: .black)
    private lazy var quakeNameLabel = QuakeLabel(fontSize: 20, fontWeight: .bold , textColor: .black)
    private lazy var quakeDateLabel = QuakeLabel(fontSize: 20, fontWeight: .light , textColor: .black)
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.cellID)
        
        
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configureContainer()
        
    }
    
    
    private func configureContainer() {
        containerView.layer.cornerRadius = containerView.frame.height / 5
        containerView.dropShadow()
    }
    
    private func setupTexts() {
        locationLabel.text = "Location:"
        
    }
    
    private func configureCell() {
        setupTexts()
        selectionStyle = .none
        
        let locationLabePadding : CGFloat = 25
        let horizontalPadding: CGFloat = 20
        let verticalPadding: CGFloat = 12
        let symbolHeight: CGFloat = 20
        
        addSubview(containerView)
        addSubviews(arrowRightImageView , quakeNameLabel , locationLabel , quakeDateLabel)
        
        NSLayoutConstraint.activate([
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: verticalPadding),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalPadding),
            
            locationLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor , constant: locationLabePadding),
            
            quakeNameLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5),
            quakeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            quakeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            
            
            arrowRightImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            arrowRightImageView.trailingAnchor.constraint(equalTo:  containerView.trailingAnchor, constant: -horizontalPadding),
            arrowRightImageView.widthAnchor.constraint(equalToConstant: symbolHeight),
            arrowRightImageView.heightAnchor.constraint(equalToConstant: symbolHeight),
            
            
            quakeDateLabel.topAnchor.constraint(equalTo: quakeNameLabel.bottomAnchor, constant: 16),
            quakeDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            //quakeDateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: verticalPadding)
        ])
    }
    
    public func set(data : MainModel) {
        quakeNameLabel.text = data.title
        quakeDateLabel.text = data.date
    }
    
    
}
