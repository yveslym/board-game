//
//  Pawn.swift
//  board_game
//
//  Created by Yveslym on 5/3/18.
//  Copyright © 2018 yveslym. All rights reserved.
//

import Foundation
import UIKit

class Pawn: UIButton{
    
    var player: Player
    var neighborPlayerPosition = [Int]()
    override init(frame: CGRect) {
        
        player = Player()
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(boardSize: Int, frame: CGRect, position: Int){
       
        player = Player()
         super.init(frame: frame)
        self.getNeighborPlayerPosition(boardSize: boardSize, position: position)
    }
    
    /// Method to get the position of the 8 auther pawn surrounding the current pawn
    func getNeighborPlayerPosition(boardSize: Int, position: Int){
        for x in 1..<9{
            switch x{
            case 1:
                let otherPlayer = position - (boardSize - 1)
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 2:
                let otherPlayer = position - (boardSize)
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 3:
                let otherPlayer = position - (boardSize + 1)
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 4:
                let otherPlayer = position - 1
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 5:
                let otherPlayer = position + 1
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 6:
                let otherPlayer = position + boardSize - 1
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 7:
                let otherPlayer = position + (boardSize)
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            case 8:
                let otherPlayer = position + (boardSize + 1)
                if otherPlayer < 0{
                    neighborPlayerPosition.append(0)
                }else{
                    neighborPlayerPosition.append(otherPlayer)
                }
            default:
                break
            }
        }
    }
}
