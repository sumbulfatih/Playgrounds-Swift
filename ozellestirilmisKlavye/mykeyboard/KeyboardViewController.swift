//
//  KeyboardViewController.swift
//  mykeyboard
//
//  Created by SUMBUL on 19.01.2018.
//  Copyright © 2018 SUMBUL. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // heart =kalp
        
        let myHeartButton = UIButton(type: UIButtonType.system)
        myHeartButton.frame = CGRect(x: 150, y: 50, width: 100, height: 120)
        myHeartButton.setBackgroundImage(UIImage(named : "heart.jpg" ), for: UIControlState.normal )
        myHeartButton.addTarget(self, action: #selector(KeyboardViewController.buttonTapped) , for: UIControlEvents.touchUpInside)
        self.view.addSubview(myHeartButton)
        
        
        
        
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
   @objc func buttonTapped() {
        let textProxy = textDocumentProxy as UITextDocumentProxy
        textProxy.insertText("I LOVE YOU")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
