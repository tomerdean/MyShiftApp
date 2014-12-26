//
//  ViewControllerEmployeeEdit.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class ViewControllerEmployeeEdit: UIViewController {

    var origColor = UIColor(red: 0xe0/255, green: 0xf6/255, blue: 0xfe/255, alpha: 1.0)
    var newColor = UIColor(red: 0xcd/255, green: 0xff/255, blue: 0xd1/255, alpha: 1.0)
    
    var storeClicks = Array<Array<Int>>()
    
    
    @IBOutlet weak var sundayMorningButton: UIButton!
    
    @IBOutlet weak var sundayEveningButton: UIButton!
    
    @IBOutlet weak var monMorning: UIButton!
    

    @IBOutlet weak var monEveningButton: UIButton!
    

    @IBOutlet weak var tueMorningButton: UIButton!
    @IBOutlet weak var tueEveningButton: UIButton!
    
    @IBOutlet weak var wedMorningbutton: UIButton!
    
    
    @IBOutlet weak var webEveningButton: UIButton!
    
    
    @IBOutlet weak var thursdayMorningButton: UIButton!
    
    
    @IBOutlet weak var thursdayEveningButton: UIButton!
    
    
    @IBOutlet weak var fridayMorningButton: UIButton!
    
    
    @IBOutlet weak var fridayEveningButton: UIButton!
    
    
    @IBOutlet weak var satMorningButton: UIButton!
    
    
    @IBOutlet weak var satEveningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetValues()
        // Do any additional setup after loading the view.
    }

    func resetValues() {
        
        var rows = 10, cols = 10

        for col in 0..<10 {
            storeClicks.append(Array(count: rows, repeatedValue:Int()))
        }
    }
    
    func SaveDate(dayOffset:Int, timeOfDay:Int) {
    
        
        var time:NSDate! = addDaysToDate(NSDate(), 7 + dayOffset - getDayFromDate(NSDate()))
        println("Sent date: \(time)")
        insertShift("1", time, String(timeOfDay))
    
    }
    
    func changeColor(button:UIButton, x:Int, y:Int) {
        
        SaveDate(x, timeOfDay:y)
        
//        (String(addDaysToDate(NSDate(), 6 - getDayFromDate(NSDate())))
        
        
        
        button.backgroundColor = newColor
        
        // item is not clicked
        if (storeClicks[x][y] != 1) {
            storeClicks[x][y] = 1
            button.backgroundColor = newColor
        }
        else {
            storeClicks[x][y] = 0;
            button.backgroundColor = origColor
        }
    }
    
    @IBAction func sundayMorning(sender: UIButton) {

        changeColor(sundayMorningButton, x:1, y:1)

    }
    
    @IBAction func sundayEvening(sender: UIButton) {
        changeColor(sundayEveningButton, x:1, y:2)

    }

    
    @IBAction func monMorningClick(sender: UIButton) {
        changeColor(monMorning, x:2, y:1)

    }
    
    
    @IBAction func monEveningClick(sender: UIButton) {
        changeColor(monEveningButton, x:2, y:2)
    }
    
    
    @IBAction func tueMornClick(sender: UIButton) {
        changeColor(tueMorningButton, x:3, y:1)
    }
    
    
    @IBAction func tueEvenClick(sender: UIButton) {
        changeColor(tueEveningButton, x:3, y:2)
    }

    
    @IBAction func wedMorning(sender: UIButton) {
        changeColor(wedMorningbutton, x:4, y:1)
    }
    
    
    @IBAction func wedEvening(sender: UIButton) {
        changeColor(webEveningButton, x:4, y:2)
    }
    
    
    @IBAction func thurMorning(sender: UIButton) {
        changeColor(thursdayMorningButton, x:5, y:1)
    }
    
    
    @IBAction func thurEvening(sender: UIButton) {
        changeColor(thursdayEveningButton, x:5, y:2)
    }
    
    
    @IBAction func fridayMorning(sender: UIButton) {
        changeColor(fridayMorningButton, x:6, y:1)
    }
    
    
    @IBAction func fridayEvening(sender: UIButton) {
        changeColor(fridayEveningButton, x:6, y:2)
    }
    
    
    @IBAction func satMorning(sender: UIButton) {
        changeColor(satMorningButton, x:7, y:1)
    }
    
    
    @IBAction func satEvening(sender: UIButton) {
        changeColor(satEveningButton, x:7, y:2)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
