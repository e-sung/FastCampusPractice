//
//  UpgradeCalculatorViewController.swift
//  MyCalculator
//
//  Created by esung on 2017. 9. 20..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class UpgradeCalculatorViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet var displayLable:UILabel!
    @IBOutlet var buttonInitialization:UIButton!
    @IBOutlet var buttonReturn:UIButton!
    
    // MARK: - Properties
    var phase = Phase.makingFirstNumber
    var operation:((Double,Double) -> Double)?
    var displayNumber:Double = 0.0{
        didSet{
            self.displayLable.text = String(describing: displayNumber)
        }
    }
    var waitingNumber:Double = 0.0
    
    // MARK: - AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        displayLable.text = String(describing:displayNumber)
    }
    
    //MARK: - IBAction
    @IBAction func numberKeyPressed(btn:UIButton){
        let inputNum = Double(btn.tag)
        
        if phase == Phase.returnKeyPressed {
            displayNumber = inputNum
        }else{
            displayNumber = displayNumber*10 + inputNum
        }
    }
    
    @IBAction func operationKeyPressed(btn:UIButton){
        let opSymbol:String = (btn.titleLabel?.text!)!
        
        switch opSymbol {
        case "+":
            operation = sum
        case "-":
            operation = sub
        case "/":
            operation = div
        case "*":
            operation = mul
        default:
            print("Error : Unidentifed Operator")
        }
        phase = Phase.makingSecondNumber
        waitingNumber = displayNumber
        displayNumber = 0.0
    }
    
    @IBAction func resultKeyPressed(btn:UIButton){
        if let _ = operation{
            displayNumber = operation!(displayNumber,waitingNumber)
            phase = Phase.returnKeyPressed
        }
    }
    
    @IBAction func initKeyPressed(btn:UIButton){
        displayNumber = 0
    }
    
    //MARK: - Secret Method
    let sum = {(num1:Double,num2:Double)-> Double in num1 + num2}
    let sub = {(num1:Double,num2:Double)-> Double in num1 - num2}
    let mul = {(num1:Double,num2:Double)-> Double in num1 * num2}
    let div = {(num1:Double,num2:Double)-> Double in num1 / num2}
}
