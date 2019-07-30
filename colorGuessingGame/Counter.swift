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
    
    mutating func increseCount(){
        count += 1
    }
}

var counter = Counter()

struct HighestScore{
    var score = 0
    var highScore = Set<Int>()
    
    mutating func increaseScore()->Int{
        highScore.insert(counter.count)
        
        return highScore.max() ?? 0
    }
}
var biggestScore = HighestScore()

