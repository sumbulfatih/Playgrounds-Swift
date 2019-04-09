//: Playground - noun: a place where people can play

import UIKit

let width = view.frame.size.width
let height = view.frame.size.height

let mylabel = UILabel()
mylabel.text =  "mytext label"
mylabel.textAlignment = .center
mylabel.frame = CGRect(x: width * 0.1 , y: height * 0.3 , width: width * 0.8 , height: 50 )

view.addSubview(mylabel)


let myButton = UIButton()
myButton.frame = CGRect(x: width * 0.2, y: height * 0.5 , width: width * 0.6 , height: 50 )
myButton.setTitleColor(UIColor.blue , for: UIControlState.normal )
myButton.setTitle("my button ", for: UIControlState )


view.addSubview(myButton)

// button basıldıktan sonra işlem yapma

myButton.addTarget(self , action: #selector(UIViewController.myAction)  , for: UIControlEvents.touchUpInside)


@objc func myAction () {
    mylabel.text = "you clicked"
}
