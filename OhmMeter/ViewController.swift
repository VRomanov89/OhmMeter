//
//  ViewController.swift
//  OhmMeter
//
//  Created by Volodymyr Romanov on 10/21/15.
//  Copyright © 2015 EEEnthusiast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var band1: UIImageView!
    @IBOutlet weak var band2: UIImageView!
    @IBOutlet weak var band3: UIImageView!
    @IBOutlet weak var band4: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        band1.backgroundColor = UIColor.blueColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

