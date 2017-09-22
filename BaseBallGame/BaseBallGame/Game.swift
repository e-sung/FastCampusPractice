//
//  GameRule.swift
//  BaseBallGame
//
//  Created by esung on 2017. 9. 22..
//  Copyright © 2017년 esung. All rights reserved.
//

import Foundation
class Game{
    var answer:[Int] = [-1,-1,-1]
    var userGuesses:[Int] = [0,0,0]
    var scores:[Score]{
        get{
            var returnArray = [Score.unset,Score.unset,Score.unset]
            for i in 0..<answer.count{
                if answer[i] == userGuesses[i]{
                    returnArray[i] = Score.strike
                }else if answer.contains(userGuesses[i]){
                    returnArray[i] = Score.ball
                }else{
                    returnArray[i] = Score.out
                }
            }
            return returnArray
        }
    }
    
    func makeAnswer()->[Int]{
        var returnArray = [0,0,0]
        for i in 0..<returnArray.count{
            let randomNumber = Int(arc4random_uniform(10))
            if !returnArray.contains(randomNumber){
                returnArray[i] = randomNumber
            }
        }
        return returnArray
    }
    
    func startGame(){
        answer = makeAnswer()
        print(answer)
    }
    
    func generateScoreMessage(with scoreArray:[Score])->String{
        //Generate ResultMessage based on Calculated Scores
        let strikes = (scoreArray.occurenceOf(item: Score.strike))
        let balls = (scoreArray.occurenceOf(item: Score.ball))
        let outs = (scoreArray.occurenceOf(item: Score.out))
        var resultMessage = ""
        resultMessage += "Strikes = \(strikes)\n"
        resultMessage += "Balls = \(balls)\n"
        resultMessage += "Outs = \(outs)"
        return resultMessage
        
    }
}
