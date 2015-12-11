//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

extension Double {
    var km : Double{return self * 1_000.0}



}

let oneInch = 23.2.km

print(oneInch)

extension Int{

    subscript (var digitIndex : Int) -> Int{
        var decimalBase = 1
        while digitIndex > 0 {
            decimalBase *= 10
            --digitIndex
        
        
        }
    
        return (self / decimalBase) % 10
    }



}


123456789[3]
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
