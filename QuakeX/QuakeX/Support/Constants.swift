//
//  Constants.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/3/22.
//

import UIKit

struct Constants {
    
    static let url = "https://api.orhanaydogdu.com.tr/deprem/live.php?limit=100"
    static let baseUrl = "https://api.orhanaydogdu.com.tr"
    
    struct Text {
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occured"
        }
        
        enum Bar {
            static let quakes = "Last Quakes"
            static let emergencyContacts = "Emergency Contacts"
            static let settings = "Settings"
        }
        
    }
    
    struct Style {
        enum Image {
            static let arrowRight =  UIImage(systemName: "arrow.right")
            static let pin = UIImage(systemName: "mappin")
            static let placeholder = UIImage(systemName: "person.crop.rectangle.fill")
            static let quakes = UIImage(systemName: "house")
            static let emergencyContacts = UIImage(systemName: "person.3")
            static let settings = UIImage(systemName: "gearshape")
        }
        
        enum Color {
            static let green = UIColor.systemGreen
            static let label = UIColor.label
            static let lightestGray = UIColor.systemGray6
            static let lightGray = UIColor.systemGray5
            static let background = UIColor.systemBackground
            static let secondaryBackground = UIColor.secondarySystemBackground
            static let red = UIColor.red
            static let black = UIColor.black
        }
        
    }
    
    
}
