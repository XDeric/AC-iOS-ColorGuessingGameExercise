//
//  Counter.swift
//  colorGuessingGame
//
//  Created by EricM on 7/30/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import Foundation

struct Counter {
    var count = 0
    var score = 0
    var highScore = Set<Int>()
    
    mutating func increseCount(){
        count += 1
    }
    
    mutating func increaseScore()->Int{
        highScore.insert(count)
        score = highScore.max() ?? 0
        return score
    }
}

