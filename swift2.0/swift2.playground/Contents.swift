//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

str = "switf 2"
let base = 3
let power = 10
var answer = 1
for _ in 1...power {

    answer *= base
}

for var i = 0 ; i<4 ;i++
{
    print(i)

}

var answ = 10

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0

repeat {
    // 顺着梯子爬上去或者顺着蛇滑下去
    square += board[square]
    // 掷骰子
    if ++diceRoll == 7 { diceRoll = 1 }
    // 根据点数移动
    square += diceRoll
} while square < finalSquare
print("Game over!")
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

if #available(iOS 9,OSX 10.10,  *){

    print("9.0")
    
}else{
        print("later 9.0")
    
}

func sayHello(personName : String) ->String {
    let greeting = "hello, " + personName + " !"
    return greeting
}


let hello = sayHello("wangkai")

print(sayHello("lilei"))

func halfOpenRangeLength(start : Int , end : Int) -> Int{
    
    return end - start

}


print(halfOpenRangeLength(3, end: 4))

func sayHelloWorld() -> String{

    return "hello,world"
}

print(sayHelloWorld())

func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}


print(printAndCount("1"))

print(printWithoutCounting("hello, world !!!"))

func minMax (array : [Int]) -> (min : Int , max : Int){

    if array.isEmpty {
        
        return (0 , 0)
    }
    
    var minV = array[0];
    var maxV = array[0];
    
    for value in array[1..<array.count]{
    
        if value < minV {
        
            minV = value;
        }else if value > maxV {
        
            maxV = value;
        }
        
        
    }

    return (minV,maxV)


}


let minM = minMax([1,2,3,5,4,11,33,22])
minM.min

func someFunction(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to
    // the argument values for the first and second parameters
}
someFunction(1, 2)
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight("", totalLength: 10, pad: "*")

print(paddedString)

func swapTwoInts(inout a : Int , inout _ b : Int) {

    let temp = a
    a = b
    b = temp

}

var someInt = 3
var another = 5

swapTwoInts(&someInt, &another)
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTwoInts(a: Int, _ b: Int) -> Int {
    return a * b
}

var mathFunction: (Int, Int) -> Int = addTwoInts

mathFunction = multiplyTwoInts


func addWithNumber(mathFunction : (Int , Int) -> Int , _ a : Int , _ b : Int){

  print("Result: \(mathFunction(a, b))")
    
}

addWithNumber(addTwoInts, 3, 5)

func stepForward(input : Int) -> Int {
    return input + 1
}

func stepBackward(input : Int) -> Int{
    return input - 1
}


func chooseStepFunction(backwards : Bool) -> (Int) -> Int
{

return backwards ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)

print("Counting to zero:")
// Counting to zero:
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")


let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//var reversed = names.sort(>)

func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

var reversed1 = names.sort({(s1 : String ,s2 : String) -> Bool in return s1 > s2 })
print(reversed1)
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // 函数体部分
}

someFunctionThatTakesAClosure({})

someFunctionThatTakesAClosure(){
}
let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]


let strings = numbers.map{
    
    (var number) -> String in
    
    var output = ""
    while number > 0 {
    
        output = digitNames[number%10]! + output
    
        number /= 10
    
    }
    return output
}

print(strings)

enum someEnum{
  case  someEnumStart
  case  someEnumStop
}


var st = someEnum.someEnumStart
st = .someEnumStop


enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
enum CompassPoint {
    case North
    case South
    case East
    case West
}
var directionToHead = CompassPoint.West

directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguins")
case .East:
    print("Where the sun rises")
case .West:
    print("Where the skies are blue")
}

enum Barcode{

    case UPCA(Int,Int,Int)
    case QRCode(String)

}

var productBarcode = Barcode.UPCA(1, 2, 3)
productBarcode = .QRCode("123")

let abbbb = CompassPoint.West

enum PlanetLn: Int {
    case Mercury = 0, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

let earthsOrder = PlanetLn.Earth.rawValue

let nummpp = PlanetLn.Mars.rawValue

let possibleP = PlanetLn(rawValue: 10)

indirect enum ArithmeticExpression {
    case Number(Int)
    case Addition(ArithmeticExpression, ArithmeticExpression)
    case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

struct FixedLengthRange{
    var firstValue : Int
    let length : Int

}

let rangeOfFoutItems = FixedLengthRange(firstValue: 0, length: 4)

class DataImporter {
    var fileName = "data.txt"
}

class DataManger {
    lazy var importer = DataImporter()
    var data = [String]()
    
}

let manger = DataManger()
manger.data.append("some data")
manger.data.append("some more data")
print(manger.importer.fileName)


struct Point {
    var x = 0.0 ,y = 0.0
}

struct Size {
    var width = 0.0 ,height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center : Point{
    
        get {
            
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
        
            return Point(x: centerX, y: centerY)
        }
        
        set {
            
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
            
        
        
        }
        
    }
    
    
    
    
}

var squared = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 0.0, height: 0.0))
let initSq = squared.center
squared.center = Point(x: 10.0, y: 15.0)
print("square.origin is now at (\(squared.origin.x), \(squared.origin.y))")



struct Cuboid {
    var width = 0.0,height = 0.0, depth = 0.0
    var volme : Double{
    
        return width * height * depth
    }
}

let fourBy = Cuboid(width: 5, height: 5, depth: 5)
fourBy.volme

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps


class JianFa {
    var sum : Int = 0{
    
        willSet{
            print("sum === \(sum)")
        }
    
        didSet{
        
            if sum > oldValue {
                print("Added \(sum - oldValue) steps")
            }
        
        }
    
    }
}

let jf = JianFa()
jf.sum = 10

jf.sum = 20

jf.sum = 10

jf.sum = 30









