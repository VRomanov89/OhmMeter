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

    var pickerDataSource0 = ["Band 1", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Gray", "White"];
    var pickerDataSource1 = ["Band 2", "Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet", "Gray", "White"];
    var pickerDataSource2 = ["Band 3", "Silver", "Gold", "Black", "Brown", "Red", "Orange", "Yellow", "Green", "Blue", "Violet"];
    var pickerDataSource3 = ["Band 4", "Silver", "Gold", "Brown", "Red", "Green", "Blue", "Violet"];
    var pickerDataSource0row:Int = 0
    var pickerDataSource1row:Int = 0
    var pickerDataSource2row:Int = 0
    var pickerDataSource3row:Int = 0
    var res1:Int = 0
    var res2:String = ""
    var tolerance:String = "???"

    override func viewDidLoad() {
        super.viewDidLoad()
        band1.backgroundColor = UIColor.blueColor()
        picker.delegate = self
        picker.dataSource = self
        resistance.numberOfLines = 2;
        band1.backgroundColor = UIColor.lightGrayColor()
        band2.backgroundColor = UIColor.lightGrayColor()
        band3.backgroundColor = UIColor.lightGrayColor()
        band4.backgroundColor = UIColor.lightGrayColor()
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
            switch row {
            case 1:
                band1.backgroundColor = UIColor.brownColor()
                break
            case 2:
                band1.backgroundColor = UIColor.redColor()
                break
            case 3:
                band1.backgroundColor = UIColor.orangeColor()
                break
            case 4:
                band1.backgroundColor = UIColor.yellowColor()
                break
            case 5:
                band1.backgroundColor = UIColor.greenColor()
                break
            case 6:
                band1.backgroundColor = UIColor.blueColor()
                break
            case 7:
                band1.backgroundColor = UIColor.purpleColor()
                break
            case 8:
                band1.backgroundColor = UIColor.grayColor()
                break
            case 9:
                band1.backgroundColor = UIColor.whiteColor()
                break
            default:
                break
            }
        } else if component == 1 {
            pickerDataSource1row = row
            switch row {
            case 1:
                band2.backgroundColor = UIColor.blackColor()
                break
            case 2:
                band2.backgroundColor = UIColor.brownColor()
                break
            case 3:
                band2.backgroundColor = UIColor.redColor()
                break
            case 4:
                band2.backgroundColor = UIColor.orangeColor()
                break
            case 5:
                band2.backgroundColor = UIColor.yellowColor()
                break
            case 6:
                band2.backgroundColor = UIColor.greenColor()
                break
            case 7:
                band2.backgroundColor = UIColor.blueColor()
                break
            case 8:
                band2.backgroundColor = UIColor.purpleColor()
                break
            case 9:
                band2.backgroundColor = UIColor.grayColor()
                break
            case 10:
                band2.backgroundColor = UIColor.whiteColor()
                break
            default:
                break
            }
        } else if component == 2 {
            pickerDataSource2row = row
            switch row {
            case 1:
                band3.backgroundColor = UIColor.lightGrayColor()
                break
            case 2:
                band3.backgroundColor = UIColor(red: 252.0/255.0, green: 194.0/255.0, blue: 0, alpha: 1.0)
                break
            case 3:
                band3.backgroundColor = UIColor.blackColor()
                break
            case 4:
                band3.backgroundColor = UIColor.brownColor()
                break
            case 5:
                band3.backgroundColor = UIColor.redColor()
                break
            case 6:
                band3.backgroundColor = UIColor.orangeColor()
                break
            case 7:
                band3.backgroundColor = UIColor.yellowColor()
                break
            case 8:
                band3.backgroundColor = UIColor.greenColor()
                break
            case 9:
                band3.backgroundColor = UIColor.blueColor()
                break
            case 10:
                band3.backgroundColor = UIColor.purpleColor()
                break
            default:
                break
            }
        } else if component == 3 {
            pickerDataSource3row = row
            switch row {
            case 0:
                tolerance = "???"
                break
            case 1:
                band4.backgroundColor = UIColor.lightGrayColor()
                tolerance = "10%"
                break
            case 2:
                band4.backgroundColor = UIColor(red: 252.0/255.0, green: 194.0/255.0, blue: 0, alpha: 1.0)
                tolerance = "5%"
                break
            case 3:
                band4.backgroundColor = UIColor.brownColor()
                tolerance = "1%"
                break
            case 4:
                band4.backgroundColor = UIColor.redColor()
                tolerance = "2%"
                break
            case 5:
                band4.backgroundColor = UIColor.greenColor()
                tolerance = "0.5%"
                break
            case 6:
                band4.backgroundColor = UIColor.blueColor()
                tolerance = "0.25%"
                break
            case 7:
                band4.backgroundColor = UIColor.purpleColor()
                tolerance = "0.1%"
                break
            default:
                break
            }
        }
        
        if (pickerDataSource0row != 0 && pickerDataSource1row != 0 && pickerDataSource2row != 0) {
            let res1 = Double(((pickerDataSource1row-1) + (pickerDataSource0row) * 10)) * pow(Double(10),Double(pickerDataSource2row - 3))
            resistance.text = String(res1) + " Ohms\n Tolerance: " + tolerance
        }
    }

    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

