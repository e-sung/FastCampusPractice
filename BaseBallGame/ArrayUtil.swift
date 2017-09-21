//
//  Util.Swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation

public extension Array where Element:Equatable{
    
    func occurenceOf(item:Element)->Int{
        var counter = 0
        for i in 0..<self.count{
            if item == self[i]{
                counter += 1
            }
        }
        return counter
    }
}
