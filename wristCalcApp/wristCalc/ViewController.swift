//
//  ViewController.swift
//  wristCalc
//
//  Created by Aldo Ayala on 7/31/18.
//  Copyright © 2018 Aldo Ayala. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    enum iphoneModes {
        case NOT_SET
        case ADDITION
        case SUBTRACTION
        case Multiply
        case Divide
        case Percentage
    }
  
    var lastBtnMode:Bool = false
    var userNumbersString:String = "0"
    
    var savedNum:Double = 0
     var currentMode:iphoneModes = iphoneModes.NOT_SET
    */
    @IBOutlet weak var userPhoneScreen: UILabel!
    @IBAction func tapped0(){tappedNumber(num: 0)}
    @IBAction func tapped1(){tappedNumber(num: 1)}
    @IBAction func tapped2(){tappedNumber(num: 2)}
    @IBAction func tapped3(){tappedNumber(num: 3)}
    @IBAction func tapped4(){tappedNumber(num: 4)}
    @IBAction func tapped5(){tappedNumber(num: 5)}
    @IBAction func tapped6(){tappedNumber(num: 6)}
    @IBAction func tapped7(){tappedNumber(num: 7)}
    @IBAction func tapped8(){tappedNumber(num: 8)}
    @IBAction func tapped9(){tappedNumber(num: 9)}

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 /*
    func changeMode(newMode: iphoneModes) {
        if userNumbersString == "0" {
            return
        }
        currentMode = newMode
        lastBtnMode = true
    }

    @IBAction func plusBtnSelected(_ sender: UIButton) {
       changeMode(newMode: iphoneModes.ADDITION)
    }
    
    
    @IBAction func minusBtnSelected(_ sender: UIButton) {
        changeMode(newMode: iphoneModes.SUBTRACTION)
    }
    
    @IBAction func multBtnSelected(_ sender: UIButton) {
        changeMode(newMode: iphoneModes.Multiply)
    }
    
    @IBAction func divBtnSelected(_ sender: UIButton) {
        changeMode(newMode: iphoneModes.Divide)
    }

//    @IBAction func numberSelection(_ sender: UIButton) {
//        if userPhoneScreen.text == "0" {
//            userPhoneScreen.text = ""
//        }
//        userPhoneScreen.text = userPhoneScreen.text! + String(sender.tag - 1)
//}
    func tappedNumber (num: Int){
        if lastBtnMode {
            lastBtnMode = false
            userNumbersString = "0"
        }
        userNumbersString = userNumbersString.appending("\(num)")
        print(userNumbersString)
        updateText()
    }

    @IBAction func equalsSelected(_ sender: UIButton) {
        guard let num:Double = Double(userNumbersString) else {
            return
        }
        if currentMode == iphoneModes.NOT_SET || lastBtnMode {
            return
        }
        if currentMode == iphoneModes.ADDITION {
            print(savedNum)
            savedNum += num
        }
        else if currentMode == iphoneModes.SUBTRACTION {
            savedNum -= num
        }
        if currentMode == iphoneModes.Multiply {
            savedNum *= num
        }
        if currentMode == iphoneModes.Divide {
            savedNum /= num
        }
        if currentMode == iphoneModes.Percentage {
            
        }
        currentMode = iphoneModes.NOT_SET
        userPhoneScreen.text = "\(savedNum)"
        updateText()
        lastBtnMode = true
        
    }
    @IBAction func clearSelected() {
        savedNum = 0
        userNumbersString = "0"
        userPhoneScreen.text = "0"
        currentMode = iphoneModes.NOT_SET
        lastBtnMode = false
        
    }
    func updateText() {
        guard let labelInt:Double = Double(userNumbersString) else {
            userPhoneScreen.text = ("Number is too Large")
            return
        }
        savedNum = Double(labelInt)
   //     savedNum = (currentMode == iphoneModes.NOT_SET) ? (Double(labelInt)) : savedNum
        print(savedNum)
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let nsInt: NSNumber = NSNumber(value: labelInt)
        let str:String = formatter.string(from: nsInt)!
        
        userPhoneScreen.text = str
        print(str)
    }
    */
    
    
    enum modes {
        case NOT_SET
        case ADDITION
        case SUBTRACTION
        case Multiply
        case Divide
        case Percentage
    }
    
    var labelString:String = "0"
    
    var currentMode:modes = modes.NOT_SET
    var savedNum:Double = 0
    var lastButtonMode:Bool = false
    
    
    func tappedNumber (num: Int){
        if lastButtonMode {
            lastButtonMode = false
            labelString = "0"
        }
        print(num)
        labelString = labelString.appending("\(num)")
        
        print(labelString)
        updateText()
    }
    
    func updateText() {
        guard let labelInt:Double = Double(labelString) else {
            print(labelString)
            userPhoneScreen.text = "Number is too Large"
            return
        }
        savedNum = (currentMode == modes.NOT_SET) ? (Double(labelInt)) : savedNum
        
        let formatter:NumberFormatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.decimal
        let nsInt: NSNumber = NSNumber(value: labelInt)
        let str:String = formatter.string(from: nsInt)!
        
        userPhoneScreen.text = str
        
    }
    
    
    func changeMode(newMode: modes) {
        if savedNum == 0 {
            return
        }
        currentMode = newMode
        lastButtonMode = true
    }
    
    @IBAction func plusSelected() {
        changeMode(newMode: modes.ADDITION)
    }
    
    @IBAction func minusSelected() {
        changeMode(newMode: modes.SUBTRACTION)
    }
    
    @IBAction func multiplySelected() {
        changeMode(newMode: modes.Multiply)
    }
    
    @IBAction func divideSelected() {
        changeMode(newMode: modes.Divide)
    }
    @IBAction func clearSelected() {
        savedNum = 0
        labelString = "0"
        userPhoneScreen.text = "0"
        currentMode = modes.NOT_SET
        lastButtonMode = false
        
    }
    @IBAction func percentSelected() {
        changeMode(newMode: modes.Percentage)
        print("% selected")
    }
    @IBAction func equalsSelected() {
        guard let num:Double = Double(labelString) else {
            return
        }
        if currentMode == modes.NOT_SET || lastButtonMode {
            return
        }
        if currentMode == modes.ADDITION {
            savedNum += num
            
        }
        if currentMode == modes.SUBTRACTION {
            savedNum -= num
        }
        if currentMode == modes.Multiply {
            savedNum *= num
        }
        if currentMode == modes.Divide {
            savedNum /= num
        }
        if currentMode == modes.Percentage {
            
        }
        currentMode = modes.NOT_SET
        labelString = "\(savedNum)"
        updateText()
        lastButtonMode = true
    }

    
}

