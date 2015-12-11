//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//嵌套类型实践
struct BlackjackCard{
    //嵌套的枚举
    enum Suit : Character{
    
    case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
        
    }
    
    //嵌套的Rank 枚举
    enum Rank : Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
    
        struct Values {
            let first : Int, second : Int?
        }
        var values : Values {
        
            switch self {
            
            case .Ace:
                return Values(first: 1, second: 11)
            case .Jack, .Queen, .King:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            
            
            }
        
        }
        
    }
    
    
    var rank : Rank, suit : Suit
    var description : String {
        var output = "suit is \(suit.rawValue),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second{
            output += " or \(second)"
        
        
        }
        
        return output
    
    
    }
    
 
}


var theAceofSpades = BlackjackCard(rank: .Ace, suit: .Spades)
print("theAceOfSpades: \(theAceofSpades.description)")

theAceofSpades.rank = .King

print("theAceOfSpades: \(theAceofSpades.description)")

let hearts = BlackjackCard.Suit.Hearts.rawValue











