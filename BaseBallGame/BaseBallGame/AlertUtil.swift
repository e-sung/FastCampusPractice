//
//  UiUtil.swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 21..
//  Copyright © 2017년 esung. All rights reserved.
//
import UIKit
import Foundation
class AlertUtil{
    let duplicateWarningController:UIAlertController
    let outOfChanceWarningController:UIAlertController
    private let defaultAction:UIAlertAction
    
    init() {
        duplicateWarningController = UIAlertController(title: "Warning", message: "Every choice should be Unique", preferredStyle: .alert)
        outOfChanceWarningController = UIAlertController(title: "Warning", message: "Out Of Chance! Starting New Game!", preferredStyle: .alert)
        
        defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        duplicateWarningController.addAction(defaultAction)
        outOfChanceWarningController.addAction(defaultAction)
    }
}
