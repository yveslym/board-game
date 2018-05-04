//
//  Player.swift
//  board_game
//
//  Created by Yveslym on 5/3/18.
//  Copyright © 2018 yveslym. All rights reserved.
//
import UIKit
import Foundation

class Player{
   
    var currentPlayer : CurrentPlayer
    
    init(currentPlayer: CurrentPlayer){
        self.currentPlayer = currentPlayer
    }
}

enum CurrentPlayer: String {
    case first
    case second
    case none
}
