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
    var positionX: Int
    var positionY: Int
    var neighborPlayerPosition = [Int]()
    override init(frame: CGRect) {
        
        player = Player(currentPlayer: .none)
        positionX = 0
        positionY = 0
        super.init(frame: frame)
        self.layer.cornerRadius = frame.size.width / 2
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(boardSize: Int, frame: CGRect, position: Int){
        positionX = 0
        positionY = 0
        player = Player(currentPlayer: .none)
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
            //self.checkBorderPawn(boardSize: boardSize, position: position)
        }
    }
    func checkBorderPawn(boardSize: Int, position: Int){
        
        /// check top right corner
        if (position % boardSize) == 0{
            self.neighborPlayerPosition[2] = 0
             self.neighborPlayerPosition[4] = 0
             self.neighborPlayerPosition[7] = 0
        }
        /// check the left corner
        if (self.positionX == 0){
            self.neighborPlayerPosition[0] = 0
            self.neighborPlayerPosition[3] = 0
            self.neighborPlayerPosition[5] = 0
        }
        /// check the bottom corner
        if (self.positionY == (boardSize - 1)){
            self.neighborPlayerPosition[5] = 0
            self.neighborPlayerPosition[6] = 0
            self.neighborPlayerPosition[7] = 0
        }
    }
}






