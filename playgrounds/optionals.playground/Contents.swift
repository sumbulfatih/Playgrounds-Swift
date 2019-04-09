//: Playground - noun: a place where people can play

import UIKit

var myName : String?

myName?.uppercased()


//optionals:  ?  ve !


//cok riskli bir durum kullanıcı yanlış girerse program patlar.
 // var myAge = "5"
// var myResult = Int(myAge)! * 5

var myAge = "10"

if let number = Int(myAge) {
    
    let myResult = number * 5
    print(myResult)
    
}

