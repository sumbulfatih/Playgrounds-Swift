//
//  ViewController.swift
//  fakirUygulamasıBonusHediyeOyunu
//
//  Created by SUMBUL on 25.01.2018.
//  Copyright © 2018 SUMBUL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var resim3: UIImageView!
    @IBOutlet weak var resim1: UIImageView!
    @IBOutlet weak var resim2: UIImageView!
    @IBOutlet weak var resim4: UIImageView!
    @IBOutlet weak var resim5: UIImageView!
    @IBOutlet weak var resim6: UIImageView!
    @IBOutlet weak var resim7: UIImageView!
    @IBOutlet weak var resim8: UIImageView!
    @IBOutlet weak var resim9: UIImageView!
    var score = 0
    var timer = Timer()
    var counter = 0
    var FakirArray = [UIImageView]()
    var hideTimer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        let highScore = UserDefaults.standard.object(forKey: "highscore")
        if highScore == nil {
            highScoreLabel.text = "0"
        }
        if let newScore = highScore as? Int {
            highScoreLabel.text = String(newScore)
        }
        scoreLabel.text = "Score: \(score)"
        let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
         let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
          let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
           let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
        let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
         let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
          let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
           let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
            let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(ViewController.increaseScore))
       
        resim1.isUserInteractionEnabled = true
         resim2.isUserInteractionEnabled = true
          resim3.isUserInteractionEnabled = true
           resim4.isUserInteractionEnabled = true
            resim5.isUserInteractionEnabled = true
       resim6.isUserInteractionEnabled = true
        resim7.isUserInteractionEnabled = true
         resim8.isUserInteractionEnabled = true
           resim9.isUserInteractionEnabled = true
        
        resim1.addGestureRecognizer(recognizer1)
         resim2.addGestureRecognizer(recognizer2)
          resim3.addGestureRecognizer(recognizer3)
           resim4.addGestureRecognizer(recognizer4)
           resim5.addGestureRecognizer(recognizer5)
        resim6.addGestureRecognizer(recognizer6)
        resim7.addGestureRecognizer(recognizer7)
        resim8.addGestureRecognizer(recognizer8)
        resim9.addGestureRecognizer(recognizer9)
        counter = 30
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideFakir), userInfo: nil, repeats: true)
        //arrays
        
        FakirArray.append(resim1)
        FakirArray.append(resim2)
        FakirArray.append(resim3)
        FakirArray.append(resim4)
        FakirArray.append(resim5)
        FakirArray.append(resim6)
        FakirArray.append(resim7)
        FakirArray.append(resim8)
        FakirArray.append(resim9)
        
        hideFakir()
        
    }
    
    @objc func hideFakir() {
        
        for Fakir in FakirArray {
            Fakir.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(FakirArray.count - 1)))
        
       FakirArray[random].isHidden = false
        
    }
    @objc func countDown() {
        
        counter = counter - 1
        timeLabel.text = "\(counter)"
        
        if counter == 0 {
            timer.invalidate()
            hideTimer.invalidate()
            
            
            if self.score > Int(highScoreLabel.text!)! {
                
                UserDefaults.standard.set(self.score, forKey: "highscore")
                highScoreLabel.text = String(self.score)
                
            }
            
            
            let alert = UIAlertController(title: "Time", message: "Time's Up", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
                
                self.score = 0
                self.scoreLabel.text = "Score: \(self.score)"
                self.counter = 30
                self.timeLabel.text = "\(self.counter)"
                
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.countDown), userInfo: nil, repeats: true)
                self.hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.hideFakir), userInfo: nil, repeats: true)
                
            })
            
            alert.addAction(replayButton)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }

        
    }
    
    @objc func increaseScore() {
        
        score = score + 1
        scoreLabel.text = "Score: \(score)"
        
    }

    


}

