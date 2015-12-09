//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
numberOfLegs["bird"] = 2

numberOfLegs["tiger"] = 10

numberOfLegs

struct Matrix {
    let rows : Int,columns : Int
    var grid : [Double]
    init(rows:Int,columns:Int){
    
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
        
    
    
    }
    
    func indexIsValidForRow(row : Int , column : Int)->Bool{
    
        return row >= 0 && row < rows && column >= 0 && column < columns
    
    
    }
    
    subscript(row : Int ,column : Int)-> Double{
    
        get {
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            
                return grid[(row * columns) + column]
            
            
            
            
        }
    
        set {
            assert(indexIsValidForRow(row, column: column),"Index out of range")
            
            grid[(row * columns) + column] = newValue
        
        }
    
    
    }
    
    
    
}

var matrix = Matrix(rows: 2, columns: 2)

let someValue = matrix[1,1]


class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // 什么也不做-因为车辆不一定会有噪音
    }
}


let someVe = Vehicle()

someVe.description

class Bicycle : Vehicle {
    var hasBasket = false
}


let bicycle = Bicycle()
bicycle.description
bicycle.currentSpeed

bicycle.hasBasket

class Tandem : Bicycle {
    var currentNumberOfPassengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true

tandem.currentSpeed
tandem.currentNumberOfPassengers

class Train : Vehicle {
    override func makeNoise() {
        print("Choo CHoo")
    }
}


let train = Train()
train.makeNoise()


class Car : Vehicle {
    var gear = 1
    override var description : String{
    
        return super.description + "in gear \(gear)"
    }
}


let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print(car.description)


class AutomaticCar : Car {
    override var currentSpeed : Double{
    
        didSet {
            
            gear = Int(currentSpeed / 10.0) + 1
        
        }
        
        willSet{
        
            print("willSet ---- \(gear)")
        }
    }
}


let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print(automatic.description)

struct Celsius{
    var temp : Double
    
    init(fromFahrenheit fahren : Double){
    
        temp  = (fahren - 32.0) / 1.8
    
    }

    init(fromKelvin kelvin : Double){
    
        temp = kelvin - 273.15
    }
    
    init(_ celsius :Double){
    
        temp = celsius
    }

}


let boil = Celsius(fromFahrenheit: 212.0)

let free = Celsius(fromKelvin: 273.15)

print("\(boil)----\(free)")

let body = Celsius(22.9)
print(body)


class SurveyQuestion {
    let text : String
    var respinse : String?
    
    init(text : String){
    
        self.text = text + "123"
    }
    
    func ask(){
    
        print(text)
        
    }
    
    
}


let beets = SurveyQuestion(text: "How about beets?")
beets.ask()
beets.respinse = "i also like beets"
print(beets.respinse)

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}

class Country {

    let name : String
    var capitalCity : City!
    init(name : String , capitalName : String){
        self.name = name
        self.capitalCity = City(name : capitalName , country: self)
    }
}






class Residence {
    var numberOfRooms = 1
}

class Person{
    
    var residence : Residence?

}

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}



































