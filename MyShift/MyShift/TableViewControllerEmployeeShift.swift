//
//  TableViewControllerEmployeeShift.swift
//  MyShift
//
//  Created by omri on 12/26/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class TableViewControllerEmployeeShift: UITableViewController {

    @IBOutlet weak var cell1: UITableViewCell!
    @IBOutlet weak var cell2: UITableViewCell!
    @IBOutlet weak var cell3: UITableViewCell!
    @IBOutlet weak var cell4: UITableViewCell!
    @IBOutlet weak var cell7: UITableViewCell!
    @IBOutlet weak var cell6: UITableViewCell!
    @IBOutlet weak var cell5: UITableViewCell!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var result = getCurrShifts(user_id)
        
        for var i = 0; i < result.count; i++ {
            
            var dayNumber = getDayFromDate(result[i]["shift_date"] as NSDate)
            
            if(result[i]["shift_time"] as NSString == "evening") {
                
                
                switch dayNumber {
                case 1:
                    cell1.textLabel?.text = "a"
                case 2:
                    cell2.textLabel?.text = "a"
                case 3:
                    cell3.textLabel?.text = "a"
                case 4:
                    cell4.textLabel?.text = "a"
                case 5:
                    cell5.textLabel?.text = "a"
                case 6:
                    cell6.textLabel?.text = "a"
                case 7:
                    cell7.textLabel?.text = "a"
                default:
                    cell7.textLabel?.text = "a"
                }
            }
            else {
                
                switch dayNumber {
                case 1:
                    cell1.textLabel?.text = "b"
                case 2:
                    cell2.textLabel?.text = "b"
                case 3:
                    cell3.textLabel?.text = "b"
                case 4:
                    cell4.textLabel?.text = "b"
                case 5:
                    cell5.textLabel?.text = "b"
                case 6:
                    cell6.textLabel?.text = "b"
                case 7:
                    cell7.textLabel?.text = "b"
                default:
                    cell7.textLabel?.text = "b"
                }
            }
        }
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 7
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
