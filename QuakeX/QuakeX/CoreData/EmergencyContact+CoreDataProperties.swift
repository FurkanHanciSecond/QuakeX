//
//  EmergencyContact+CoreDataProperties.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/28/22.
//
//

import Foundation
import CoreData


extension EmergencyContact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EmergencyContact> {
        return NSFetchRequest<EmergencyContact>(entityName: "EmergencyContact")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: String?

}

extension EmergencyContact : Identifiable {

}
