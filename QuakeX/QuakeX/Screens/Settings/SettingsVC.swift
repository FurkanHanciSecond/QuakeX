//
//  SettingsVC.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/13/22.
//

import UIKit
import StoreKit
import MessageUI
class SettingsVC: UIViewController {
    
    private lazy var notificationSettingsButton = QButton()
    private lazy var rateUsButton = QButton()
    private lazy var sendFeedBackButton = QButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        configureView()
        configureUI()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
        self.title = Constants.Text.Bar.settings
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setMail() {
        if MFMailComposeViewController.canSendMail() {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self
                mail.setToRecipients(["furkanhanci265@gmail.com"])
                mail.setMessageBody("Your app is great!", isHTML: false)

                present(mail, animated: true)
            } else {
                AlertManager.showAlert(title: "Error", message: "Mail Feature Cannot Working This Device ☹️", viewController: self)
            }
    }
    
    @objc private func sendMail(_ sender : UIButton) {
        setMail()
    }
    
    @objc private func requestReview(_ sender : UIButton) {
        guard let scene = view.window?.windowScene else {
            print("scene is not found")
            return
        }
        
        if #available(iOS 14, *) {
            SKStoreReviewController.requestReview(in: scene)

        }
    }
    
    @objc private func presentSettings(_ sender: UIButton) {
        if let appSettings = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(appSettings) {
            UIApplication.shared.open(appSettings)
        }
    }
    
    private func configureUI() {
        let padding : CGFloat = 20
        view.addSubviews(notificationSettingsButton , rateUsButton , sendFeedBackButton)
        
        NSLayoutConstraint.activate([
        
            notificationSettingsButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            notificationSettingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            notificationSettingsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            notificationSettingsButton.heightAnchor.constraint(equalToConstant: 45),
            
            rateUsButton.topAnchor.constraint(equalTo: notificationSettingsButton.bottomAnchor, constant: padding),
            rateUsButton.trailingAnchor.constraint(equalTo: notificationSettingsButton.trailingAnchor),
            rateUsButton.leadingAnchor.constraint(equalTo: notificationSettingsButton.leadingAnchor),
            rateUsButton.heightAnchor.constraint(equalToConstant: 45),

            
            sendFeedBackButton.topAnchor.constraint(equalTo: rateUsButton.bottomAnchor, constant: padding),
            sendFeedBackButton.trailingAnchor.constraint(equalTo: notificationSettingsButton.trailingAnchor),
            sendFeedBackButton.leadingAnchor.constraint(equalTo: notificationSettingsButton.leadingAnchor),
            sendFeedBackButton.heightAnchor.constraint(equalToConstant: 45),

            
        ])
        
        notificationSettingsButton.addTarget(self, action: #selector(presentSettings(_:)), for: .touchUpInside)
        notificationSettingsButton.set(backgroundColor: Constants.Style.Color.blue, title: "Notification Settings")
        
        rateUsButton.addTarget(self, action: #selector(requestReview(_:)), for: .touchUpInside)
        rateUsButton.set(backgroundColor: Constants.Style.Color.blue, title: "Rate Us")
        
        sendFeedBackButton.addTarget(self, action: #selector(sendMail(_:)), for: .touchUpInside)
        sendFeedBackButton.set(backgroundColor: Constants.Style.Color.blue, title: "Send FeedBack")
    }
}

extension SettingsVC : MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
