//
//  Sign.swift
//  RPS
//
//  Created by zac on 2021/07/06.
//

import Foundation
import GameplayKit

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
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

