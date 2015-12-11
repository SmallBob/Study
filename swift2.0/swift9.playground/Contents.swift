//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol SomeProtocol{
    
    var mustBeSettable : Int{get set}
    var doesNotNeedToBeSettable : Int {get}
    
}

func swapTwoInts (inout a :Int, inout _ b : Int){

    let temp = a
    a = b
    b = temp

}

var someInt = 3
var anotherInt = 12
swapTwoInts(&someInt, &anotherInt)

print("\(someInt)--\(anotherInt)")


func swapTwoValues<T>(inout a : T ,inout _ b: T){

    let temp = a
    a = b
    b = temp

}


var someString = "123"
var anotherString = "333"
swapTwoValues(&someString, &anotherString)
print("\(someString)--\(anotherString)")



func swapTwoValue<InoutValue>(inout a : InoutValue, inout _ b : InoutValue){
    let temp = a
    a = b
    b = temp

}

swapTwoValue(&someString, &anotherString)
print("\(someString)--\(anotherString)")


func someFunction<T:SomeProtocol , U : SomeProtocol>(someT : T , someU : U){

}



func findIndex<T : Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

private func someFunction() -> (Int,Int){ return (0,0)}


struct TrackedString {
    private(set) var numberOfEdits = 0
    var value : String = "" {
    
        didSet{
            
            numberOfEdits++
        
        }
    }
}


var  stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " +1 "
stringToEdit.value += " +2 "
//stringToEdit.numberOfEdits = 10

print(stringToEdit.numberOfEdits)


let initiaBits : UInt8 = 0b00001111
let invertedBits = ~initiaBits
print(invertedBits)

let someBits : UInt8 = 0b10110010
let moreBits : UInt8 = 0b01011110
let combinedbits = someBits | moreBits

let shiftBits: UInt8 = 4 // 即二进制的 00000100
shiftBits << 1           // 00001000
shiftBits << 2           // 00010000
shiftBits << 5           // 10000000
shiftBits << 6           // 00000000
shiftBits >> 2           // 00000001

struct Vector2D {
    var x = 0.0 , y = 0.0
}

func + (left : Vector2D , right : Vector2D) -> Vector2D{

    return Vector2D(x: left.x + right.x, y: left.y + right.y)

}

let vector = Vector2D(x: 3.0, y: 1.0)
let anotherVector = Vector2D(x: 2.0, y: 4.0)
let combinedVector = vector + anotherVector


print(combinedbits)

func greetPeople(person : String) -> String{
    return "Hello,\(person)"

}
let guestList = ["Chris", "Jill", "Tim"]

let fullGreetings = guestList.map(greetPeople)
















