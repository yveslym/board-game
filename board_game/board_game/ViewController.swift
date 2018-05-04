//
//  ViewController.swift
//  board_game
//
//  Created by Yveslym on 5/3/18.
//  Copyright © 2018 yveslym. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var pawnBoard = [Pawn]()
    var mainBoard: UIView!
    var boardSize: Int!
    var player = Player(currentPlayer: .none)
    override func viewDidLoad() {
        super.viewDidLoad()
       boardSize = 20
        
       
        
        setUpGame()
    }
    
    @objc func pawnTapped(_ pawn: Pawn){
        
        GameCenter.startGame(pawn: pawn, player: player)
        
        print("player: \(player.currentPlayer)")
        print("pawn \(pawn.tag) neighboor: \(pawn.neighborPlayerPosition)" )
        
        print("X positon: \(pawn.positionX)")
        print("Y positon: \(pawn.positionY)")
        print("-------------------------------------------")
        //let player = Player(currentPlayer: .first)
        //pawn.player = player
        
    }
}



extension ViewController{
    func setUpGame(){
       
        let rect = CGRect(x: view.frame.origin.x + 10, y: view.frame.origin.y + 40, width: view.frame.width, height: view.frame.height / 1.5)
        mainBoard = UIView(frame: rect)
        
        
        var views = [UIView]()
        
        // find the width for each view(8 views in total)
        let widgth = mainBoard.frame.width / CGFloat( boardSize)
        
        // find the higth for each view (8 views in total)
        let heigth  = mainBoard.frame.width / CGFloat( boardSize)
        
        
        var x = CGFloat()
        var y = CGFloat()
        var count = -1
        var countPoin = 1
        // create each view and add them in the mainboard
        for h in 0..<boardSize {
            
            
            if h == 0{
                y = 0.0
            }else{
                y = views[count].frame.origin.y + heigth
            }
            
            for w in 0..<boardSize {
                
                if w == 0{
                    x = 0.0
                }else{
                    x = views[count].frame.origin.x + widgth
                }
                
                let rec = CGRect(x: x, y: y, width: widgth, height: heigth)
                let newView = UIView(frame: rec)
                (views.count == 0) ? (newView.tag = 1) : (newView.tag = views[count].tag + 1)
                var image = UIImage(named: "Rectangle")
                (countPoin % boardSize == 0) ? (image = UIImage(named: "left line")) : (image = UIImage(named: "Rectangle"))
                
                
                let imageView = UIImageView(frame: rec)
                imageView.image = image
                
               
                let poinrect = CGRect(x: 0, y: 0, width: imageView.frame.width / 1.5 , height: imageView.frame.height / 1.5 )
                
                let pawn = Pawn(frame: poinrect)
                
                pawn.center = imageView.bounds.origin
                pawn.addTarget(self, action: #selector(self.pawnTapped(_:)), for: .touchUpInside)
                
                // Add pawn position
                pawn.positionX = w
                pawn.positionY = h
                
                pawn.titleLabel?.text = "\(countPoin)"
                pawn.tag = countPoin
                
                
                
                
                pawn.isUserInteractionEnabled = true
                imageView.isUserInteractionEnabled = true
                
                pawn.backgroundColor = UIColor.clear
                // imageView.addGestureRecognizer(tapGesture)
                imageView.addSubview(pawn)
                
                
                mainBoard.addSubview(imageView)
                views.append(imageView)
                pawnBoard.append(pawn)
                count += 1
                countPoin += 1
            }
        }
        pawnBoard.forEach{
            $0.getNeighborPlayerPosition(boardSize: boardSize, position: $0.tag)
            $0.checkBorderPawn(boardSize: boardSize, position: $0.tag)
        }
        self.view.addSubview(mainBoard)
    }
}







