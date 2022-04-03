//
//  ViewController.swift
//  RPS
//
//  Created by zac on 2021/07/05.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var appSign: UILabel!
    @IBOutlet private weak var gameStatus: UILabel!
    @IBOutlet private weak var rockButton: UIButton!
    @IBOutlet private weak var paperButton: UIButton!
    @IBOutlet private weak var scissorsButton: UIButton!
    @IBOutlet private weak var playAgainButton: UIButton!
   
}
    
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreen(.start)
    }
    
}

extension ViewController {
    
    @IBAction private func pressRock(_ sender: Any) {
        play(.rock)
    }
    
    @IBAction private func pressPaper(_ sender: Any) {
        play(.paper)
    }
    
    @IBAction private func pressScissors(_ sender: Any) {
        play(.scissors)
    }
    
    @IBAction private func pressPlayAgain(_ sender: Any) {
        updateScreen(.start)
    }
    
}

extension ViewController {
    
    private func updateScreen(_ state: GameState) {
        gameStatus.text = state.message
        
        switch state {
        case .start: view.backgroundColor = UIColor.white
        case .win: view.backgroundColor = UIColor.cyan
        case .lose: view.backgroundColor = UIColor.orange
        case .draw: view.backgroundColor = UIColor.green
        }
        
        if state == .start {
            appSign.text = "🤖"
            
            playAgainButton.isHidden = true
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            
            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
        }
    }
    
}

extension ViewController {
    
    private func play(_ playerSign: Sign) {
        let randomSign = randomSign()
        let gameResult = playerSign.versus(randomSign)
        
        updateScreen(gameResult)
        
        appSign.text = randomSign.emoji
        
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        switch playerSign {
        case .rock:
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
        }
        
        playAgainButton.isHidden = false
    }
    
}


