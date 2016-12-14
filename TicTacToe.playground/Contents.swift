//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

extension Array
{
    func has(_ i: (Int, Int)) -> Bool
    {
        if let anObject: (Int, Int) = i
        {
            for obj in self
            {
                if let anObj: (Int, Int) = obj as! (Int, Int)
                {
                    if anObj == anObject { return true }
                }
            }
        }
        return false
    }
}

let canvasFrame = CGRect(x: 0, y: 0, width: 400, height: 400)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas

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
                print(z,i)
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
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

let boardView = BoardView(boardWidth: 300, boardHeight: 300)
canvas.addSubview(boardView)
boardView.center = canvas.center

struct Board {
    
    enum Marker {
        case cross
        case circle
    }
    
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

var board = Board()

board.currentTurn()
board.move(x: 0, y: 0)
board.move(x: 1, y: 0)
board.move(x: 0, y: 2)
board.move(x: 0, y: 1)
board.move(x: 2, y: 2)
board.move(x: 1, y: 1)
board.move(x: 1, y: 2)

board.winner()

