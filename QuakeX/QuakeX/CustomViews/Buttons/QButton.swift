//
//  QButton.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/28/22.
//

import UIKit

class QButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(backgroundColor : UIColor , title : String) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
    }
    
    private func configure() {
        setTitleColor(Constants.Style.Color.background, for: .normal)
      titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
      
      translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      layer.cornerRadius = bounds.height / 2
    }
    
    public func set(backgroundColor: UIColor, title: String) {
      self.backgroundColor = backgroundColor
      setTitle(title, for: .normal)
    }

}
