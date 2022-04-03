import UIKit
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

randomSign()
randomSign()
randomSign()

var greeting = "Hello, playground"

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "🖐"
        case .scissors: return "✌️"
        }
    }
    
    func versus(_ sign: Sign) -> GameState {
        switch self {
        case .rock:
            switch sign {
            case .rock: return .draw
            case .paper: return .lose
            case .scissors: return .win
            }
        case .paper:
            switch sign {
            case .rock: return .win
            case .paper: return .draw
            case .scissors: return .lose
            }
        case .scissors:
            switch sign {
            case .rock: return .lose
            case .paper: return .win
            case .scissors: return .draw
            }
        }
    }
}


var myTurn = Sign.rock

myTurn.versus(.rock)
myTurn.versus(.paper)
myTurn.versus(.scissors)

myTurn = .paper

myTurn.versus(.rock)
myTurn.versus(.paper)
myTurn.versus(.scissors)

myTurn = .scissors

myTurn.versus(.rock)
myTurn.versus(.paper)
myTurn.versus(.scissors)


enum GameState {
    case start, win, lose, draw
}





