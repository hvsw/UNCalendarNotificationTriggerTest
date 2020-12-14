//
//  ViewController.swift
//  LocalNotifications
//
//  Created by Henrique Valcanaia on 2020-12-14.
//  Copyright © 2020 Henrique Valcanaia. All rights reserved.
//

import UserNotifications
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let c: Set<Calendar.Component> = [.year, .month, .day, .hour, .minute, .second]
//        let d1 = Date()
//        
//        let a = Calendar.current.dateComponents(c, from: d1)
//        print(a)
//        
//        let secondsFromGMT = TimeZone.current.secondsFromGMT()
//        print(secondsFromGMT)
//        let d2 = d1.addingTimeInterval(TimeInterval(secondsFromGMT))
//        let b = Calendar.current.dateComponents(c, from: d2)
//        print(b)
    }
    
    @IBAction func tap(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.body = "body"
        content.sound = .default
        content.threadIdentifier = "thread id"
        content.userInfo = [:]
        
        let secondsFromGMT = TimeInterval(TimeZone.current.secondsFromGMT())
        print(secondsFromGMT)
        
        let fireDateCaralho = Date().addingTimeInterval(2)
        print(fireDateCaralho)
        
        let fireDateDateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
                                                                     from: fireDateCaralho)
        print(fireDateDateComponents)
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: fireDateDateComponents,
                                                            repeats: false)
        
        let notificationRequest = UNNotificationRequest(identifier: content.threadIdentifier,
                                                        content: content,
                                                        trigger: calendarTrigger)
        
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let e = error {
                print(e)
            }
        }
    }
}
