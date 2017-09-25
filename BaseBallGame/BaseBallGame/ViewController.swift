//
//  ViewController.swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: Properties
    private var game:Game = Game()
    private var pickerArray:[UIPickerView]?
   
    //MARK: IBOutlets
    @IBOutlet var btnPlayBall: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var remainChanceLabel: UILabel!
    @IBOutlet var picker0:UIPickerView!
    @IBOutlet var picker1:UIPickerView!
    @IBOutlet var picker2:UIPickerView!
    
    //MARK: IBActions
    @IBAction func handleStart(btn:UIButton){
        game.startNewGame() //Make new Answers, reset userGuesses, etc...
        for picker in pickerArray!{
            picker.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func handlePlayBall(btn:UIButton){
        
        if(game.userGuesses.hasDuplicatedItem){
            // Show Alert Message
            let warningPopup = AlertUtil().duplicateWarningController
            self.present(warningPopup, animated: true, completion: nil)
        }else{
            resultLabel.text = game.scoreMessage
            game.chances -= 1
            remainChanceLabel.text = "\(game.chances)"
            
            // If out of chances, show warningPopup and start new game
            if(game.chances == 0){
                let warningPopup = AlertUtil().outOfChanceWarningController
                self.present(warningPopup, animated: true, completion:initView)
                game.startNewGame()
            }
        }
    }
    
    // Mark : ViewController Methods
    private func initView(){
        for picker in pickerArray!{
            picker.selectRow(5000, inComponent: 0, animated: true)
        }
        resultLabel.text = ""
    }
    
    // MARK: PickerView Methods
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10000
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row%10)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        game.userGuesses[pickerView.tag] = row%10
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerArray = [picker0,picker1,picker2]
        initView()
    }
}
