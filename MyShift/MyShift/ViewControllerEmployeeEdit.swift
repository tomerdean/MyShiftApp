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
    
    
    @IBOutlet weak var sundayMorningButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sundayMorning(sender: UIButton) {

        
        println("color is currently \(sundayMorningButton.backgroundColor)")
        sundayMorningButton.backgroundColor = newColor
        /*
        // item is not clicked
        if (saveClicks[10] == false) {
            saveClicks.insert(true, atIndex: 10)
            sundayMorningButton.backgroundColor = newColor
        }
        else {
            saveClicks[10] = false;
            sundayMorningButton.backgroundColor = origColor
        }*/
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
