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
    // Show Alert Message
    
    
    private let alertController:UIAlertController
    private let defaultAction:UIAlertAction
    
    init() {
        alertController = UIAlertController(title: "Warning", message: "Every choice should be Unique", preferredStyle: .alert)
        
        defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alertController.addAction(defaultAction)
    }
    
    public func getPopup()-> UIAlertController{
        return alertController
    }
    
}
