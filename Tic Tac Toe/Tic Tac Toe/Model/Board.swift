//
//  Board.swift
//  Tic Tac Toe
//
//  Created by Miriam Hendler on 12/11/16.
//  Copyright © 2016 Miriam Hendler. All rights reserved.
//

import Foundation
import UIKit

enum Marker {
    case cross
    case circle
}

struct Board {
    
    
    var marker: Marker = .cross
    var xMoves: [(Int,Int)] = []
    var oMoves: [(Int, Int)] = []
    
    mutating func move(x: Int, y: Int) {
        var currentTurn: Marker
        switch marker {
        case .cross:
            xMoves.append((x,y))
            currentTurn = .circle
        case .circle:
            oMoves.append((x,y))
            currentTurn = .cross
        }
        marker = currentTurn
    }
    func currentTurn() -> Marker {
        return marker
    }
    
    func gameLogic(markerMoves: [(Int, Int)]) -> Bool {
        //check horizontal
        if markerMoves.has((0,0)) && markerMoves.has((1,0)) && markerMoves.has((2,0)){
            return true
        } else if markerMoves.has((0,1)) && markerMoves.has((1,1)) && markerMoves.has((2,1)){
            return true
        } else if markerMoves.has((0,2)) && markerMoves.has((1,2)) && markerMoves.has((2,2)){
            return true
        }
            //check vertical
        else if markerMoves.has((0,0)) && markerMoves.has((0,1)) && markerMoves.has((0,2)){
            return true
        }
        else if markerMoves.has((1,0)) && markerMoves.has((1,1)) && markerMoves.has((1,2)){
            return true
        }
        else if markerMoves.has((2,0)) && markerMoves.has((2,1)) && markerMoves.has((2,2)){
            return true
        }
            //check diagnal
        else if markerMoves.has((0,0)) && markerMoves.has((1,1)) && markerMoves.has((2,2)){
            return true
        }
        else if markerMoves.has((2,0)) && markerMoves.has((1,1)) && markerMoves.has((0,2)){
            return true
        }
        return false
    }
    
    func winner() -> Marker? {
        if gameLogic(markerMoves: oMoves) {
            return .circle
        } else if gameLogic(markerMoves: xMoves) {
            return .cross
        }
        return nil
    }
    
}
