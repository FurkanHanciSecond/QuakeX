//
//  UITableView+Ext.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/16/22.
//

import UIKit

extension UITableView {
    func removeExcessCells() {
      tableFooterView = UIView(frame: .zero)
    }
    
    func reloadDataOnMainThread() {
       DispatchQueue.main.async {
         self.reloadData()
       }
     }
}
