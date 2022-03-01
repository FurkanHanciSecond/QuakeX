//
//  EmergencyTableViewCell.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/24/22.
//

import UIKit

class EmergencyTableViewCell: UITableViewCell {

    private lazy var containerView : UIView = {
       let view = UIView()
        view.backgroundColor = Constants.Style.Color.secondaryBackground
        view.addBorder()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var phoneImage : UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = Constants.Style.Color.white
        imageView.image = Constants.Style.Image.phone
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var contactNameLabel = QuakeLabel(fontSize: 20, fontWeight: .medium, textColor: .white)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: Constants.emergencyCellID)
        setupCell()
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
    }
    
    private func setupCell() {
        selectionStyle = .none
        configureUI()
    }
    
    private func configureUI() {
        let padding : CGFloat = 20
        let horizontalPadding: CGFloat = 20
        let verticalPadding: CGFloat = 12
        let symbolHeight: CGFloat = 25
        
        addSubview(containerView)
        addSubviews(phoneImage , contactNameLabel)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horizontalPadding),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horizontalPadding),
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: verticalPadding),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -verticalPadding),
            
            phoneImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            phoneImage.leadingAnchor.constraint(equalTo:  containerView.leadingAnchor, constant: horizontalPadding),
            phoneImage.widthAnchor.constraint(equalToConstant: symbolHeight),
            phoneImage.heightAnchor.constraint(equalToConstant: symbolHeight),
            
            contactNameLabel.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: padding),
            contactNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: padding),
            contactNameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        ])
    }
    
    public func setCell(data : EmergencyContact?) {
        contactNameLabel.text = data?.name
    }
    
}
