//
//  ViewController.swift
//  colorGuessingGame
//
//  Created by EricM on 7/30/19.
//  Copyright © 2019 EricM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var highestScore: UILabel!
    
    @IBOutlet weak var color: UIView!
    
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var reset: UIButton!
    
    @IBOutlet weak var lose: UILabel!
    @IBOutlet weak var new: UIButton!
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    var alpha: CGFloat = 0.0
    
    func mixColor()-> UIColor{
         red = CGFloat.random(in: 0...1)
         green = CGFloat.random(in: 0...1)
         blue = CGFloat.random(in: 0...1)
         alpha = CGFloat.random(in: 0...1)
        let myColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        return myColor
    }
    
    var counter = Counter()
    
    @IBAction func redColor(_ sender: UIButton) {
        if red >= green && red >= blue{
            increaseCount()
            self.color.backgroundColor = mixColor()
        }
        else{
            hidden(false)
            counter.count = 0
        }
        updateScore()
    }
    
    @IBAction func greenColor(_ sender: UIButton) {
        if green >= red && green >= blue{
            increaseCount()
            self.color.backgroundColor = mixColor()
        }
        else{
            hidden(false)
            counter.count = 0
        }
        updateScore()
    }
    
    @IBAction func blueColor(_ sender: UIButton) {
        if blue >= green && blue >= red{
            increaseCount()
            self.color.backgroundColor = mixColor()
        }
        else{
            hidden(false)
            counter.count = 0
        }
        updateScore()
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        hidden(true)
        increaseHighScore()
        self.color.backgroundColor = mixColor()
        r.isEnabled = true
        g.isEnabled = true
        b.isEnabled = true
    }
    
    override func viewDidLoad() {
        self.score.text = "Current Score: \(counter.count)"
        self.highestScore.text = "Highest Score: \(counter.increaseScore())"
        super.viewDidLoad()
        self.color.backgroundColor = mixColor()
        // Do any additional setup after loading the view.
    }
    
    private func updateScore(){
        self.score.text = "Current Score: \(counter.count)"
        self.highestScore.text = "Highest Score: \(counter.increaseScore())"
    }
    private func increaseHighScore(){
        counter.highScore.insert(counter.count)
        //counter.increaseScore()
    }
    private func increaseCount(){
        counter.increseCount()
    }
    
    private func hidden(_ a:Bool){
        if a == true{
            lose.isHidden = true
            reset.isHidden = true
        }
        else{
            lose.isHidden = false
            reset.isHidden = false
            r.isEnabled = false
            g.isEnabled = false
            b.isEnabled = false
        }
    }

}

