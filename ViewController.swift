//
//  ViewController.swift
//  Les Dates
//
//  Created by Adib Lgs on 2019-10-03.
//  Copyright © 2019 Adib Lgs. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateStringLbl: UILabel!
    
    @IBOutlet weak var timeIntervalLbl: UILabel!
    
    @IBOutlet weak var calendarLbl: UILabel!
    
    @IBOutlet weak var ilyaLbl: UILabel!
    
    let format = "EEE dd MMM yy - HH:mm:ss - zzzz"
    

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    @IBAction func dateChoisie(_ sender: UIDatePicker) {
        let date = sender.date
        //dateStringLbl.text = date.toString()
        dateStringLbl.text = date.stringWithFormat(format)
        timeIntervalLbl.text = date.timeStamp()
        calendarLbl.text = date.quelJour()
        ilyaLbl.text = date.components()
    }
    

}
extension Date {
    
    func toString() -> String {
    let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: self)
    }
    
    func stringWithFormat(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: self)
    }
    func timeStamp() -> String {
        let tempsEcoule = self.timeIntervalSinceNow
        return String(format: "%.2f", tempsEcoule )
    }
    func quelJour() -> String {
        var str = ""
        let cal = Calendar.current
        if cal.isDateInToday(self) {
            str += "Aujourd'hui "
        }
        if cal.isDateInYesterday(self) {
            str += "Hier "
        }
        if cal.isDateInTomorrow(self) {
            str += "Demain "
        }
        if cal.isDateInWeekend(self) {
            str += "Nous sommes le week-end"
        }
        return str
    }
    func components() -> String {
        let cal = Calendar.current
        let components = cal.dateComponents([.month, .day, .hour, .minute], from: self,
            to: Date())
        let month = components.month ?? 0
        let day = components.day ?? 0
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        return "Temps écoulé -> mois: \(month), jour(s): \(day), heure(s): \(hour), minute(s): \(minute)"
        
    }
}

