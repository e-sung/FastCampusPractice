//
//  VendingItem.swift
//  VendingMachine
//
//  Created by esung on 2017. 9. 15..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation
class VendingItem{
    let name:String 
    let price:Int
    
    init(withName name:String, andPrice price:Int) {
        self.name = name
        self.price = price
    }
    
}
