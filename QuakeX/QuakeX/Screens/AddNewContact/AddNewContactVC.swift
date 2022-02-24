//
//  AddNewContactVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit

class AddNewContactVC: UIViewController {
    private lazy var contactNumberTextField : UITextField = {
       let textField = UITextField()
        textField.placeholder = "Enter Contact Number 😊"
        textField.layer.cornerRadius = 15
        textField.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textField.autocorrectionType = UITextAutocorrectionType.default
        textField.keyboardType = UIKeyboardType.numberPad
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    private lazy var contactNameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Contact Name 😃"
        textField.layer.cornerRadius = 15
        textField.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        textField.autocorrectionType = UITextAutocorrectionType.default
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setup()
    }
    
    private func setup() {
        configureTextFields()
    }
    
    private func configureTextFields() {
        let padding : CGFloat = 35
        let textFieldHeight : CGFloat = 50
        view.addSubviews(contactNameTextField , contactNumberTextField)
        
        contactNameTextField.backgroundColor = .black
        contactNumberTextField.backgroundColor = .black
        contactNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        contactNameTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            contactNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            contactNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -padding),
            contactNumberTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            
            contactNameTextField.topAnchor.constraint(equalTo: contactNumberTextField.bottomAnchor, constant: padding),
            contactNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            contactNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -padding),
            contactNameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight)
            
        ])
    }

}
