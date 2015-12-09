//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"


class Room {
    let name : String
    init(name : String){ self.name = name}
}


class Address {
    
    var buildingName : String?
    var buildingNumber : String?
    var street : String?
    
    func buildingIdentifier()->String{
    
        if buildingName != nil {
            
            return buildingName!
            
        }else if buildingNumber != nil && street != nil {
            
            return "\(buildingNumber) \(street)"
            
        }else{
            
        return "nil"
            
        }
    
    
    }
}

class Person {
    var residence : Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms : Int{
        return rooms.count
        
    }
    
    subscript(i : Int) -> Room{
        get {
         return rooms[i]
            
        }
        set(newl) {
            rooms[i] = newl
        }
    
    }
    
    
    func  printNumberOfRooms(){
    
        print("\(numberOfRooms)")
    }
    
    var address : Address?
}



let john = Person()
if let roomCount = john.residence?.numberOfRooms{
    print("\(roomCount)")
}else{

    print("no")

}




func createAddress() -> Address{

    print("Function was called.")
    let someAddress = Address()
    someAddress.buildingNumber = "26"
    someAddress.street = "zhongyangdajie"
    return someAddress
    

}

john.residence?.address = createAddress()
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72


print(testScores)


let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laurel Street"
john.residence?.address = johnsAddress

print("this is \(john.residence)")


if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet).")
} else {
    print("Unable to retrieve the address.")
}


enum VendingMachineError : ErrorType{
    case InvalidSelection
    case InsufficientFunds(coinsNeeded : Int)
    case OutOfStock

}

throw VendingMachineError.InsufficientFunds(coinsNeeded: 5)



struct Item {
    var price : Int
    var count : Int
}


class VendingMachine {
    var inventory = [
        "Candy Bar" :Item(price: 12, count: 7),
        "Chips":Item(price: 10, count: 4),
        "Pretzels":Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    func dispenseSnack(snack : String){
    
        print("DIspensing \(snack)")
    }
    
    func vend(itemNamed name : String) throws {
    
        guard var item = inventory[name] else {
            
            throw VendingMachineError.InvalidSelection
        
        }
        guard item.count > 0 else {
        
            throw VendingMachineError.OutOfStock
        }
        
        guard item.price <= coinsDeposited else {
        
            throw VendingMachineError.InsufficientFunds(coinsNeeded: item.price - coinsDeposited)
        
        }
        
        coinsDeposited -= item.price
        --item.count
        inventory[name] = item
        dispenseSnack(name)
        
    
    }
    
}































