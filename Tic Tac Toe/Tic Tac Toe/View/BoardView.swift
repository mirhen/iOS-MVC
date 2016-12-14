//
//  BoardView.swift
//  Tic Tac Toe
//
//  Created by Miriam Hendler on 12/11/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import Foundation
import UIKit

class BoardView: UIView {
    var boardHeight: CGFloat?
    var boardWidth: CGFloat?
    var fieldHeight: CGFloat?
    var feildWidth: CGFloat?
    var tappedX: Int = 0
    var tappedY: Int = 0
    
    init(boardWidth: CGFloat, boardHeight: CGFloat) {
        self.boardWidth = boardWidth
        self.boardHeight = boardHeight
        self.feildWidth = boardWidth/3
        self.fieldHeight = boardHeight/3
        super.init(frame: CGRect(x: 0, y: 0, width: self.boardWidth!, height: self.boardHeight!))
        createFeild()
    }
    
    init(fieldHeight: CGFloat, fieldWidth: CGFloat) {
        self.fieldHeight = fieldHeight
        self.feildWidth = fieldWidth
        self.boardWidth = self.feildWidth! * 3
        self.boardHeight = self.fieldHeight! * 3
        super.init(frame: CGRect(x: 0, y: 0, width: boardWidth!, height: boardHeight!))
        createFeild()
    }
    func createFeild() {
        for i in 0..<3 {
            for z in 0..<3 {
                let fieldView = UIView(frame: CGRect(x: feildWidth! * CGFloat(i), y: fieldHeight! * CGFloat(z), width: feildWidth!, height: fieldHeight!))
                let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_ :)))
                self.addGestureRecognizer(tap)
                
                fieldView.layer.borderWidth = 2
                self.addSubview(fieldView)
                print(i,z)
            }
        }
    }
    func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self)
        
        if touchPoint.y <= fieldHeight! {
            tappedY = 0
        } else if touchPoint.y > fieldHeight! && touchPoint.y <= fieldHeight! * 2 {
            tappedY = 1
        } else {
            tappedY = 2
        }
        
        if touchPoint.x <= feildWidth! {
            tappedX = 0
        } else if touchPoint.x > feildWidth! && touchPoint.x <= feildWidth! * 2 {
            tappedX = 1
        } else {
            tappedX = 2
        }
        print("Board tapped at (\(tappedX), \(tappedY))")
        
        var board = Board()
        
        let turn = board.currentTurn()
        board.move(x: tappedX, y: tappedY)
        print(board.move(x: tappedX, y: tappedY))
        print(board.currentTurn())
        print(board.winner())
        switch turn {
        case .circle:
            fillInField(with: "O")
        default:
            fillInField(with: "X")
        }
    }
    
    func fillInField(with: String) {
        for i in 0..<3 {
            for z in 0..<3 {
                if tappedX == i && tappedY == z {
                    let label = UILabel(frame: CGRect(x: feildWidth! * CGFloat(i), y: fieldHeight! * CGFloat(z), width: feildWidth!, height: fieldHeight!))
                    label.text = with
                    label.sizeToFit()
                    self.addSubview(label)
                }
            }
        }
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
