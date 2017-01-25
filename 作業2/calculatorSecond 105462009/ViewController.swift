//
//  ViewController.swift
//  calculatorLatestOne 105462009
//
//  Created by Andrew  on 2016/11/23.
//  Copyright © 2016年 yenru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var operands = [Double]()
    var operatorSymbol: String?    //+-x÷
    var isTypingNumber = false
    var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            if newValue == floor(newValue) {
                display.text = "\(Int(newValue))"
            } else {
                display.text = "\(newValue)"
            }
            isTypingNumber = false
        }
    }

    @IBAction func appeneNumber(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if isTypingNumber {
            display.text! += digit
        } else {
            display.text = digit
            isTypingNumber = true
        }

    }
    
    
    @IBAction func operateNow(_ sender: UIButton) {
        isTypingNumber = false
        operatorSymbol = sender.currentTitle!
        operands.append(displayValue)
    }
    
    
    @IBAction func equalButt(_ sender: AnyObject) {
        if operatorSymbol != nil {
            isTypingNumber = false
            operands.append(displayValue)
            switch operatorSymbol! {
            case "+":
                execute() { $0 + $1 }
            case "-":
                execute() { $1 - $0 }
            case "*":
                execute() { $0 * $1 }
            case "/":
                execute() { $1 / $0 }
            default:
                break
            }
            print("\(operands)" + operatorSymbol!)
        }
    }
    
    func execute(_ operation: (Double, Double) -> Double) {
        displayValue = operation(operands.removeLast(), operands.removeLast())
        operands.append(displayValue)
    }
    
    @IBAction func doSth(_ sender: UIButton) {
        isTypingNumber = false
        displayValue = -displayValue
        
    }
    
    
    @IBAction func doSth2(_ sender: UIButton) {
        isTypingNumber = false
        displayValue = displayValue * 0.01
    }
    
    
    
    
    @IBAction func clearButt(_ sender: UIButton) {
        operands.removeAll()
        isTypingNumber = false
        operatorSymbol = nil
        displayValue = 0
    }
    

}

