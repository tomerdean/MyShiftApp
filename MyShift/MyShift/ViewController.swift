//
//  ViewController.swift
//  MyShift
//
//  Created by Tom Dean on 12/25/14.
//  Copyright (c) 2014 TeamTop. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadParse()
        getCurrShifts("bcn69t8zLD")
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

