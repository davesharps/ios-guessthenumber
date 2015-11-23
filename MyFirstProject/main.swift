//
//  main.swift
//  MyFirstProject
//
//  Created by Dave Sharples on 12/11/2015.
//  Copyright © 2015 Dave Sharples. All rights reserved.
//

import Foundation

func input() -> String {
    let keyboard = NSFileHandle.fileHandleWithStandardInput()
    let inputData = keyboard.availableData
    let rawString = NSString(data: inputData, encoding:NSUTF8StringEncoding)
    if let string = rawString {
        return string.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    } else {
        return "Invalid input"
    }
}


func randomNumber(low:Int, high:Int) ->Int {
    let range = high - (low - 1)
    return (Int(arc4random()) % range) + (low - 1)
}

let answer = randomNumber(0,high:100)
var turns = 1



while(true) {
    
    print("Guess \(turns): Guess a number between 1 and 100")
    
    let userInput = input()
    let userInput2 = Int(userInput)
    if let guess = userInput2 {
        if (guess < answer) {
            print("Higher")
        } else if (guess > answer) {
            print("Lower")
        } else {
            print("WINNER!")
            break
        }
        
    } else {
        print("You need to enter a number")
        continue
    }
    
    turns = turns + 1
}

print("It took you \(turns) to guess that the answer was \(answer)")