//
//  LoadingViewController.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit

class LoadingViewController: UIViewController {

    private var containerView: UIView!

      public func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)

        containerView.backgroundColor = Constants.Style.Color.background
        containerView.alpha = 0

        UIView.animate(withDuration: 0.3) {
          self.containerView.alpha = 0.8
        }

        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
          activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
          activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])

        activityIndicator.startAnimating()
      }

      public func dismissLoadingView() {
        DispatchQueue.main.async {
          self.containerView.removeFromSuperview()
          self.containerView = nil
        }
      }

      public func showNoResultsViewOnTableView(with message: String, on tableView: UITableView) {
        let label = QuakeLabel(fontSize: 16, fontWeight: .medium, textColor: .secondaryLabel)
        label.text = message
        tableView.addSubview(label)

        NSLayoutConstraint.activate([
          label.topAnchor.constraint(equalTo: tableView.topAnchor, constant: 16),
          label.centerXAnchor.constraint(equalTo: tableView.centerXAnchor)
        ])

        tableView.backgroundView = label
      }

}
