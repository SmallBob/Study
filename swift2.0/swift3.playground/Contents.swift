//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

class Counter{

    var count = 0
    func increment() {
        ++count
    }
    
    func incrementBy(amount : Int){
    
        count += amount
    
    }
    
    func reset(){
        count = 0
    }
    
    
    
}

var m = Counter()
m.count = 0
m.increment()
print(m.count)
m.reset()
print(m.count)
















