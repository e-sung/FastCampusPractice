//
//  ViewController.swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var btnPlayBall: UIButton!
    @IBOutlet var picker0:UIPickerView!
    @IBOutlet var picker1:UIPickerView!
    @IBOutlet var picker2:UIPickerView!
    
    //MARK: IBActions
    @IBAction func handlePlayBall(btn:UIButton){
        
        // check Duplication
        let duplicatedIndex = getDuplicatedIndex(array: userGuess)
        
        if(duplicatedIndex == -1){
            
            // If No Duplication was Found, Calculate Scores
            for i in 0..<answer.count{
                if answer[i] == userGuess[i]{
                    scores?[i] = Score.strike
                }else if answer.contains(userGuess[i]){
                    scores?[i] = Score.ball
                }else{
                    scores?[i] = Score.out
                }
            }
            
            // Generate ResultMessage based on Calculated Scores
            var resultMessage = ""
            resultMessage += "Strike : \(Util.count(item: Score.strike, in: scores!))\n"
            resultMessage += "Ball : \(Util.count(item: Score.ball, in: scores!))\n"
            resultMessage += "Out : \(Util.count(item: Score.out, in: scores!))"
            resultLabel.text = resultMessage
            
        }else{ // If Duplication was Found
            
            // Show Alert Message
            let alertController = UIAlertController(title: "Warning", message: "Every choice should be Unique", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func handleStart(btn:UIButton){
        // Initialize Game
        makeAnswer()
        userGuess = [0,0,0]
        scores = [Score.unset,Score.unset,Score.unset]
        for picker in pickerArray!{
            picker.isUserInteractionEnabled = true
        }
    }
    
    // MARK: Properties
    private var answer = [-1,-1,-1]
    private var userGuess = [-1,-1,-1]
    private var scores:[Score]?
    private var pickerArray:[UIPickerView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerArray = [picker0,picker1,picker2]
        for picker in pickerArray!{
            picker.selectRow(5000, inComponent: 0, animated: false)
        }
    }
    
    // MARK: Methods
    private func makeAnswer(){
        
        for i in 0..<answer.count{
            let randomNumber = Int(arc4random_uniform(10))
            if !answer.contains(randomNumber){
                answer[i] = randomNumber
            }
        }
        print(answer)
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100000
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row%10)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userGuess[pickerView.tag] = row%10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    private func getDuplicatedIndex(array:[Int])->Int{
        var counter = [0,0,0]
        for i in 0..<array.count{
            for j in 0..<array.count{
                if array[i] == array[j]{
                    counter[i] += 1
                    if counter[i] > 1{
                        return i
                    }
                }
            }
        }
        return -1
    }
}

