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
    private var game:Game
    private var pickerArray:[UIPickerView]?
    
    // Mark : Initialzation
    required init?(coder aDecoder: NSCoder) {
        game = Game()
        super.init(coder: aDecoder)
    }
    
    //MARK: IBOutlets
    @IBOutlet var btnPlayBall: UIButton!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var picker0:UIPickerView!
    @IBOutlet var picker1:UIPickerView!
    @IBOutlet var picker2:UIPickerView!
    
    //MARK: IBActions
    @IBAction func handleStart(btn:UIButton){
        game.startGame()
        for picker in pickerArray!{
            picker.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func handlePlayBall(btn:UIButton){
        
        if(game.userGuesses.hasDuplicatedItem){
            // Show Alert Message
            let warningPopup = AlertUtil().alertController
            self.present(warningPopup, animated: true, completion: nil)
        }else{
            // Show game score on resultLabel
            let scoreResult = game.scores
            let resultText = game.generateScoreMessage(with: scoreResult)
            resultLabel.text = resultText
        }
    }
    
    // Mark : ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerArray = [picker0,picker1,picker2]
        for picker in pickerArray!{
            picker.selectRow(5000, inComponent: 0, animated: false)
        }
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
}
