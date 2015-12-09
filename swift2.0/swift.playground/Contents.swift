//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
let names = ["anna","alex","brian","jack"]
let count = names.count

for i in 0..<count {
    print("第\(i+1) 个人叫 \(names[i])")


}
let  someString = "some"
let emptyString = ""
let emptyS = String()
let inta = Int()

emptyString.isEmpty
for character in "Dog!🐶".characters {
    print(character)
}


let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]

let eAcute: Character = "\u{E9}"                         // é
let combinedEAcute: Character = "\u{65}\u{301}"
let greeting = "hello, world!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
greeting[greeting.startIndex.advancedBy(4)]

var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)


//welcome.insertContentsOf("?", at: welcome.endIndex.predecessor())

//welcome.insertContentsOf(" there".characters, at: welcome.endIndex.predecessor())
welcome.insertContentsOf(",world".characters, at: welcome.endIndex.predecessor())

welcome.removeAtIndex(welcome.endIndex.predecessor())
print(welcome)
let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)
print(welcome)

let question = "question"
let message = "Question"

if question == message
{
    print("1")
}else{
    print("2")
}


// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

if eAcuteQuestion == combinedEAcuteQuestion {
    print("These two strings are considered equal")
}
// 打印输出 "These two strings are considered equal"


let someInt = Int()
var someInts = [Int]()

someInts.append(3)
someInts = []
var threeDoubles = [Double](count: 3, repeatedValue: 0.1)
var otherThreeDoubles = Array(count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + otherThreeDoubles

var shoppingList: [String] = ["Eggs", "Milk"]
shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
// shoppingList 现在有四项了
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
// shoppingList 现在有七项了

print(shoppingList)
shoppingList[4...6] = ["Bananas", "Apples"]
print(shoppingList)



for (index , value) in shoppingList.enumerate()
{
    print("Item \(String(index + 1)): \(value)")    
}

var favor : Set = ["Rock", "Classical", "Hip hop"]
print("I have \(favor.count) favorite music genres.")

favor.insert("Jazz")

if favor.contains("Rock"){

    print("1")
}

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]


oddDigits.intersect(singleDigitPrimeNumbers).sort()
evenDigits.intersect(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(evenDigits).sort()

oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()

oddDigits.union(evenDigits).sort()
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).")
}







