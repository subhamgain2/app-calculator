//
//  ViewController.swift
//  calculator
//
//  Created by Subham on 7/15/16.
//  Copyright © 2016 Subham Gain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var displayResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func numberPressed(sender: AnyObject) {
        
        let digit = sender.currentTitle!
        
        if userIsTyping{
            displayResult.text! = displayResult.text! + digit!
        } else {
            displayResult.text = digit
            userIsTyping = true
        }
        
        
    }
    
    var calculationOption = 0
    
    @IBAction func calculationButtonPressed(sender: AnyObject) {
        
        if userIsTyping {
            memory()
        }
        
        let senderOption = sender.currentTitle
        
       

        switch senderOption! {
        case "✖️"?:
            optionCheck()
           // doCalculation{ $0 * $1 }
                calculationOption = 1
            
        case "➗"?:
            optionCheck()
            //doCalculation{ $1 / $0 }
                calculationOption = 2
            
        case "➖"?:
            optionCheck()
            //doCalculation{ $1 - $0 }
                calculationOption = 3
            
        case "➕"?:
            optionCheck()
            //doCalculation{ $0 + $1 }
                calculationOption = 4
            
        default:
            break
        }
        
        
        
    }
    

    func doCalculation(calculation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = calculation(operandStack.removeLast(),operandStack.removeLast())
            memory()
        }
    }
    
    func optionCheck() {
        switch calculationOption {
        case 1:
            //senderOption = "✖️"
            doCalculation{ $0 * $1 }
        case 2:
            //senderOption = "➗"
            doCalculation{ $1 / $0 }
        case 3:
            //senderOption = "➖"
            doCalculation{ $1 - $0 }
        case 4:
            //senderOption = "➕"
            doCalculation{ $0 + $1 }
        default:
            break
        }
        return
    }
    
    var operandStack = Array<Double>()
    
    
    
    
    var userIsTyping = false
    
    func memory() {

            operandStack.append(displayValue)
            print("operandStack = \(operandStack)")
            userIsTyping = false
        
    }
    
    @IBAction func clearButton() {
        
        operandStack.removeAll()
        displayResult.text = "0"
        userIsTyping = false
        
    }
    var displayValue:Double {
        
        get {
          
            //userIsTyping = true
            return NSNumberFormatter().numberFromString(displayResult.text!)!.doubleValue
            
        } set {
            
            //userIsTyping = false
            displayResult.text = "\(newValue)"
        }
        
    }
    
    @IBAction func equallButtonPressed(sender: AnyObject) {
        if userIsTyping {
            memory()
        }
        
        optionCheck()
        
        //button.layer.cornerRadius = 25
        
        button.transform = CGAffineTransformMakeScale(0.9, 0.9)
        
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            
            self.button.transform = CGAffineTransformMakeScale(1,1)
            
        })
    
}

}
