//
//  AddNewContactVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit
import CoreData
class AddNewContactVC: UIViewController {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
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
    
    private lazy var saveButton = QButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupView()
        setupButton()
        setupTextFields()
        configureUI()
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground

    }
    
    private func setupButton() {
        configureButtonUI()
    }
    
    private func setupTextFields() {
        configureTextFields()
    }
    
    private func configureUI() {
        let padding : CGFloat = 35
        let textFieldHeight : CGFloat = 50
        view.addSubviews(contactNameTextField , contactNumberTextField)
        
        NSLayoutConstraint.activate([
            contactNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            contactNumberTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            contactNumberTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -padding),
            contactNumberTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            
            contactNameTextField.topAnchor.constraint(equalTo: contactNumberTextField.bottomAnchor, constant: padding),
            contactNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: padding),
            contactNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor , constant: -padding),
            contactNameTextField.heightAnchor.constraint(equalToConstant: textFieldHeight),
            
            saveButton.topAnchor.constraint(equalTo: contactNameTextField.bottomAnchor, constant: padding),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            
        ])
    }
    
    private func configureTextFields() {
        contactNameTextField.backgroundColor = .black
        contactNumberTextField.backgroundColor = .black
        contactNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        contactNameTextField.translatesAutoresizingMaskIntoConstraints = false
    }

    
    private func configureButtonUI() {
        view.addSubview(saveButton)
        saveButton.set(backgroundColor: Constants.Style.Color.blue, title: Constants.Text.saveContact)
        saveButton.addTarget(self, action: #selector(saveContact), for: .touchUpInside)
    }
    
    //TODO: MAKE WITH HELPER
   @objc private func saveContact() {
       let contact = EmergencyContact(context: self.context)
       contact.name = contactNameTextField.text
       contact.number = contactNumberTextField.text
       
       do {
           try self.context.save()
           AlertManager.showAlert(title: "Yay 🎉", message: "The Contact Has Been saved To Emergency Contacts ", alertAction: nil, viewController: self)
       } catch  {
           AlertManager.showAlert(message: QuakeError.coreDataError.rawValue, viewController: self)
       }
     
    }

}
