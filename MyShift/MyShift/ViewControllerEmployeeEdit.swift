//
//  ViewControllerEmployeeEdit.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class ViewControllerEmployeeEdit: UIViewController {

    var origColor = UIColor(red: 0xef/255, green: 0xef/255, blue: 0xef/255, alpha: 1.0)
    var newColor = UIColor(red: 0xcd/255, green: 0xff/255, blue: 0xd1/255, alpha: 1.0)
    
    var storeClicks = [[Bool]]()
    
    @IBOutlet weak var sundayMorningButton: UIButton!
    
    @IBOutlet weak var sundayEveningButton: UIButton!
    
    @IBOutlet weak var mondayMorningButton: UIButton!
    
    @IBOutlet weak var mondayEveningButton: UIButton!
    
    @IBOutlet weak var tuesdayMorningButton: UIButton!
    
    @IBOutlet weak var tuesdayEveningButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func resetValues() {
        
        for i in 1...7 {
            for e in 1...2 {
                storeClicks[i][e] = false
            }
        }
        
    }
    
    @IBAction func sundayMorning(sender: UIButton) {

        
        println("color is currently \(sundayMorningButton.backgroundColor)")
        sundayMorningButton.backgroundColor = newColor
        
        // item is not clicked
        if (storeClicks[1][1] != true) {
            storeClicks[1][1] = true
            sundayMorningButton.backgroundColor = newColor
        }
        else {
            storeClicks[1][1] = false;
            sundayMorningButton.backgroundColor = origColor
        }
    }
    
    
    @IBAction func sundayEvening(sender: UIButton) {
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
