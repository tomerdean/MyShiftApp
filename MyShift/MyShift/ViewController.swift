//
//  ViewController.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

// global variables.
var managerDayOfWeek = 0
var shiftType = ""
var user_id = ""

class ViewController: UIViewController {
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBAction func logIn(sender: AnyObject) {
        if(txtUsername.text == "admin" || txtUsername == "ADMIN" || txtUsername == "Admin")
        {
            let managerVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbManager") as ViewControllerManager
            
            self.presentViewController(managerVC, animated: true, completion: nil)
        }
        else {
        
            user_id = getUserIdByName(txtUsername.text)
            let employeeVC = self.storyboard?.instantiateViewControllerWithIdentifier("sbEmployee") as ViewControllerEmployee
            
            self.presentViewController(employeeVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadParse()
        let date = NSDate()
        var x = getShiftsForManager(date, "morning")
        println(x)
        
        //insertShift("qxVIS4YcNY", date, "morning")
        
        //var x = getUserShiftsForManager(date, "morning")
        //println(x)
        
        /*
        let date = NSDate()
        var x = resetDateTime(date)
        
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date)
        
        insertShift("6", date, "sss")

        

        println("manager choose: \(managerDayOfWeek + 1)")
        
        //var r = getShiftsForManager(x, "morning")
        //println(r)
        
        
        
        
        loadParse()
/*
        let date = NSDate()
        let calendar = NSCalendar.currentCalendar()
        let components = calendar.components(.CalendarUnitHour | .CalendarUnitMinute | .CalendarUnitMonth | .CalendarUnitYear | .CalendarUnitDay | .CalendarUnitWeekday, fromDate: date)
        let hour = components.hour
        let minutes = components.minute
        let month = components.month
        let year = components.year
        let day = components.day
        let myWeekday = components.weekday
        
        let dateStyler = NSDateFormatter()
        dateStyler.dateFormat = "yyyy-MM-dd"
        
        let myDate = dateStyler.dateFromString(components)!
        
        let myWeekday = NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekday, fromDate: myDate).weekday*/

        
        
        */
    }
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backgroundTap(sender: UIControl) {
        txtUsername.resignFirstResponder()
    }
}
