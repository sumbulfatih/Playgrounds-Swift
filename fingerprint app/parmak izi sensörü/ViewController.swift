//
//  ViewController.swift
//  parmak izi sensörü
//
//  Created by SUMBUL on 18.01.2018.
//  Copyright © 2018 SUMBUL. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var sonucLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let autContext = LAContext()
        var error : NSError?
        if autContext.canEvaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            autContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "gercektenSizmisiniz ", reply: { (succses, error) in
                if  succses == true {
                    self.sonucLabel.text = "Basarılı"
                } else {
                    
                   
                    self.sonucLabel.text = "no"
                    
                }
            })
            
            
            
        }
    
        
        
        
    



}

}
