//
//  NotificationHelper.swift
//  QuakeX
//
//  Created by Furkan Hanci on 2/20/22.
//

import UIKit
import UserNotifications
class NotificationHelper {
    static let shared = NotificationHelper()
    
    private init() { }
    
    func requestForPermission() -> Void {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert , .badge , .sound]) { success, err in
            switch success {
            case .BooleanLiteralType(true):
                print("accepted")
                
            case .BooleanLiteralType(false):
                print("not accepted :/")
                
            default:
                break;
            }
            
        }
    }
    
    //TODO: Make more pretty notification
    func setWeekday(weekDay : Int) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "Hey Quake Happened!"
        notificationContent.body = "Be Careful"
        notificationContent.badge = NSNumber(value: 1)
        notificationContent.sound = .defaultCritical
        
        //TODO: When quake is happened send notification!
        var dateComponent = DateComponents()
        dateComponent.hour = 9
        dateComponent.minute = 40
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: true)
        let request = UNNotificationRequest(identifier: "quakeNotification", content: notificationContent, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { err in
            if let error = err {
                print(err?.localizedDescription)
            }
        }
    }
    
}
