//
//  UIView+Ext.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit


extension UIView {
    func addSubviews(_ views: UIView...) {
      for view in views {
        addSubview(view)
      }
    }

    func pinToEdges(of superview: UIView) {
      translatesAutoresizingMaskIntoConstraints  = false

      NSLayoutConstraint.activate([
        topAnchor.constraint(equalTo: superview.topAnchor),
        leadingAnchor.constraint(equalTo: superview.leadingAnchor),
        trailingAnchor.constraint(equalTo: superview.trailingAnchor),
        bottomAnchor.constraint(equalTo: superview.bottomAnchor)
      ])
    }

    func dropShadow() {
        layer.shadowColor = Constants.Style.Color.cellShadow.cgColor
      layer.shadowOffset = CGSize(width: 0, height: 3)
      layer.shadowOpacity = 0.1
      layer.shadowRadius = 2
    }
    
    func dropDetailShadow() {
        layer.shadowColor = Constants.Style.Color.detailShadow.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 2
    }

    func addBorder() {
        layer.borderWidth = 0.3
      layer.borderColor = Constants.Style.Color.lightGray.cgColor
    }
}
