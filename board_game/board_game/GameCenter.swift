//
//  GameCenter.swift
//  board_game
//
//  Created by Yveslym on 5/3/18.
//  Copyright © 2018 yveslym. All rights reserved.
//

import Foundation
import UIKit

struct GameCenter{
    static let player1 = Player(currentPlayer: .first)
    static let player2 = Player(currentPlayer: .second)
    static var previousPlayer = Player(currentPlayer: .none)
    
    static func setUpGame(){
        
    }
    static func startGame(pawn: Pawn, player: Player){
      
        if checkPawnAvailable(pawn: pawn){
        // switch to the next player
        switchPlayer(player: player)
        switchPlayerColor(pawn: pawn, player: player)
            transformPawn(pawn: pawn)
        
         pawn.player = player
        }
        else{
            return
        }
    }
    /// method to swtich from one player to other
    static func switchPlayer(player: Player){
        switch (player.currentPlayer){
        case .first: player.currentPlayer = .second
        case .second: player.currentPlayer = .first
        case .none: player.currentPlayer = .first
        }
    }
    /// method to switch player color
    static func switchPlayerColor(pawn:Pawn, player: Player){
        switch (player.currentPlayer){
        case .first: pawn.backgroundColor = UIColor.red
        case .second: pawn.backgroundColor = UIColor.cyan
        case .none: pawn.backgroundColor = UIColor.clear
        }
    }
    
    /// method to check if the pawn is available
    /// return true if available
    static func checkPawnAvailable(pawn: Pawn) -> Bool{
        return pawn.player.currentPlayer == .none
    }
    static func transformPawn(pawn: Pawn){
        pawn.frame = CGRect(x: pawn.frame.origin.x, y: pawn.frame.origin.y, width: pawn.frame.size.width/1.2, height: pawn.frame.size.height / 1.2)
    }
    static func checkWinningPattern(startingPoint: Int,pawn: Pawn, previousPawn: Pawn? = nil, index: Int = 0){
        if startingPoint == pawn.tag{
            print("win")
            return
        }
        
    }
}




