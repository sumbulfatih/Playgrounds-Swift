//
//  SecondViewController.swift
//  İnstaa clone firebase
//
//  Created by SUMBUL on 22.01.2018.
//  Copyright © 2018 SUMBUL. All rights reserved.
//

import UIKit

class UploadVC: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var postCommenct: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let recogziner = UIGestureRecognizer(target: self , action : #selector(UploadVC.choosePhoto) )
        imageView.addGestureRecognizer(recogziner)
        
        
        
        super.viewDidLoad()
       }

    @IBAction func buttonClicked(_ sender: Any) {
        
    }
    @objc func  choosePhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true , completion: nil )
    
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerEditedImage] as? UIImage
        self.dismiss(animated : true , completion : nil)
    }
    


}

