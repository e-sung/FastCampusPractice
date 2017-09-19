//
//  ViewController.swift
//  MyCalculator
//
//  Created by esung on 2017. 9. 11..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Define UI components
    @IBOutlet var displayLable:UILabel!
    @IBOutlet var buttonInitialization:UIButton!
    @IBOutlet var buttonReturn:UIButton!
    
    // Define Operator Tags
    var currentOperation:CalculatorOperation = CalculatorOperation.unspecified
   
    // Define Phase Tags
    var isResultPhase = false // if '=' button was clicked
    var isOperationClicked = false // if one of "+ , - , /, %"  was clicked
    
    // Define DigitStrings
    var displayDigits = "0.0" // digits that is being displayed
    var historyDigits = "0.0" // digits that was displayed
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLable.text = displayDigits // init with '0.0'
    }
    
    @IBAction func numberKeyPressed(btn:UIButton){
        isOperationClicked = false // Exception Handler
        
        if(isResultPhase){ // If "=" is the last button clicked
            displayDigits = "0.0" // we start from ground up
            displayLable.text = displayDigits
            isResultPhase = false
        }
        
        let currentDigit = Double (displayDigits)!
        let newDigit = Double (btn.titleLabel!.text!)!
        let finalDigit = currentDigit*10.0 + newDigit
        displayDigits = String(finalDigit)
        displayLable.text = displayDigits
    }
    
    @IBAction func operationKeyPressed(btn:UIButton){
        let operation = btn.titleLabel!.text!
        switch operation{
        case "+":
            currentOperation = .addition
        case "-":
            currentOperation = .substraction
        case "/":
            currentOperation = .division
        case "%":
            currentOperation = .remainder
        case "X":
            currentOperation = .multiplication
        default:
            print("Error: Unidentified Operation")
        }
        
        if(isOperationClicked){ // Exception Handler
            return
        }
        
        historyDigits = displayDigits
        displayDigits = "0.0"
        displayLable.text = displayDigits
        isOperationClicked = true
    }
    
    @IBAction func resultKeyPressed(btn:UIButton){ //fires when "=" Button is clicked
        var resultNum = 0.0
        isResultPhase = true
        switch currentOperation {
        case .addition:
            resultNum = Double(displayDigits)! + Double(historyDigits)!
        case .substraction:
            resultNum
                = Double(historyDigits)! - Double(displayDigits)!
        case .multiplication:
            resultNum
                = Double(historyDigits)! * Double(displayDigits)!
        case .division:
            resultNum = Double(historyDigits)! / Double(displayDigits)!
        default:
            print("Error")
        }
        
        let result = String(resultNum)
        displayDigits = result
        displayLable.text = displayDigits
    }
    
    @IBAction func initKeyPressed(btn:UIButton){
        displayDigits = "0.0"
        displayLable.text = displayDigits
    }
}
