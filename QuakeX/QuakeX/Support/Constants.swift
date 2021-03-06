//
//  Constants.swift
//  QuakeX
//
//  Created by Furkan Hanci on 1/3/22.
//

import UIKit

struct Constants {
    
    static let url = "https://api.orhanaydogdu.com.tr/deprem/live.php?limit=100"
    static let baseUrl = "api.orhanaydogdu.com.tr"
    static let quakeCellID = "quakeCell"
    static let emergencyCellID = "emergencyCell"
    static let question = "?"
    static let mapReuse = "quakeMap"
    struct Text {
        static let saveContact = "Save Contact"
        enum Error {
            static let ok = "OK"
            static let oops = "Oops an error occured"
            static let noResultsFound = "No Results Found"
        }
        
        enum Bar {
            static let quakes = "Last Quakes"
            static let emergencyContacts = "Emergency Contacts"
            static let settings = "Settings"
            static let search = "Search Latest Quakes"
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
            static let phone = UIImage(systemName: "phone.fill")
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
            static let cellBackground = UIColor.cellBackground
            static let cellShadow = UIColor.cellShadow
            static let detailBackground = UIColor.detailBackground
            static let detailShadow = UIColor.detailShadow
            static let white = UIColor.white
            static let blue = UIColor.blue
        }
        
    }
    
    
}
