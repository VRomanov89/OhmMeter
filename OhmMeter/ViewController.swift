//
//  ViewController.swift
//  OhmMeter
//
//  Created by Volodymyr Romanov on 10/21/15.
//  Copyright © 2015 EEEnthusiast. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    @IBOutlet weak var band1: UIImageView!
    @IBOutlet weak var band2: UIImageView!
    @IBOutlet weak var band3: UIImageView!
    @IBOutlet weak var band4: UIImageView!
    @IBOutlet weak var resistance: UILabel!

    @IBOutlet weak var picker: UIPickerView!

    var pickerDataSource0 = ["Band 1", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White"];
    var pickerDataSource1 = ["Band 2", "Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Grey", "White"];
    var pickerDataSource2 = ["Band 3", "Silver", "Gold", "Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet"];
    var pickerDataSource3 = ["Band 4", "Silver", "Gold", "Brown", "Red", "Green", "Blue", "Violet"];
    var pickerDataSource0row:Int = 0
    var pickerDataSource1row:Int = 0
    var pickerDataSource2row:Int = 0
    var pickerDataSource3row:Int = 0
    var res1:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        band1.backgroundColor = UIColor.blueColor()
        picker.delegate = self
        picker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return pickerDataSource0[row]
        } else if component == 1 {
            return pickerDataSource1[row]
        } else if component == 2 {
            return pickerDataSource2[row]
        } else if component == 3 {
            return pickerDataSource3[row]
        } else {
            return ""
        }
        
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return pickerDataSource0.count
        } else if component == 1 {
            return pickerDataSource1.count
        } else if component == 2 {
            return pickerDataSource2.count
        } else if component == 3 {
            return pickerDataSource3.count
        } else {
            return 1
        }
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 4
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            pickerDataSource0row = row
        } else if component == 1 {
            pickerDataSource1row = row
        } else if component == 2 {
            pickerDataSource2row = row
        } else if component == 3 {
            pickerDataSource3row = row
        }
        if (pickerDataSource0row != 0 && pickerDataSource1row != 0 && pickerDataSource2row != 0 && pickerDataSource3row != 0) {
            let res1 = Double(((pickerDataSource1row-1) + (pickerDataSource0row) * 10))
            resistance.text = String((res1 * pow(Double(10),Double(pickerDataSource2row - 3))))
        }
    }

    

}

