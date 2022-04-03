//
//  GameState.swift
//  RPS
//
//  Created by zac on 2021/07/05.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    
    var message: String {
        switch self {
        case .start: return "Rock, Paper, Scissors?"
        case .win: return "You've won!"
        case .lose: return "You've lost!"
        case .draw: return "Draw! Try Again!"
        }
    }    
}

