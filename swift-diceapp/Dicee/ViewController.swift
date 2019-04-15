//
//  ViewController.swift
//  Dicee
//
//  Created by SUMBUL on 4.04.2019.
//  Copyright © 2019 SUMBUL. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    let diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6", ]  // resimlerdeki zarların dizisi oluşturuluyor.
    
    @IBOutlet weak var diceImageView1: UIImageView!      // 1.zar için image tarafı oluşturuyor.
    @IBOutlet weak var diceImageView2: UIImageView!      // 2.zar için image tarafı oluşturuyor.
    
    var randomDiceIndex1 : Int = 0
    var randomDiceIndex2 : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDiceImages()
    }

    @IBAction func rollButtonPressed(_ sender: UIButton) {   // roll butonuna basılma durumu
        
        updateDiceImages()   // her basıldığında yenilenme fonksiyonu sağlanıyor.
        
    }
    

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
            
        updateDiceImages()        
   
    }
    
    func updateDiceImages() {
        
        
        randomDiceIndex1 = Int.random(in: 0 ... 5)
        randomDiceIndex2 = Int.random(in: 0 ... 5)
        
        diceImageView1.image = UIImage(named: diceArray[randomDiceIndex1])
        diceImageView2.image = UIImage(named: diceArray[randomDiceIndex2])
        
    }
    
    
    
}

