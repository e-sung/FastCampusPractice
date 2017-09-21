//
//  Util.Swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 21..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation

class Util{
    
    public static func count(item:Score, in array:[Score])->Int{
        var counter = 1
        for el in array{
            if el == item{
                counter += 1
            }
        }
        return counter
    }
    
    public static func count(item:Int, in array:[Int])->Int{
        var counter = 0
        for el in array{
            if el == item{
                counter += 1
            }
        }
        return counter
    }
}
