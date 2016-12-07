import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

let colors: [UIColor] = [.green, .gray, .purple, .yellow, .red, .orange, .lightGray, .white, .blue]

/*:
 **Task**: Create an even grid on the `canvas`, made out of squares that each are one third as wide and one third as high as the `canvas`.Use the same colors as in the picture (they are already defined for you above in the `colors` array):
 
 ![Challenge 4](./challenge4.png "Challenge 4")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
//let squareWidth = Int(canvas.frame.width) / 3
//let squareHeight = squareWidth
//var squareX = squareWidth
//var squareY = squareHeight
//var c = -1
//for i in 0..<3 {
//    for z in 0..<3 {
//    let squareFrame = CGRect(x: squareX * z, y: squareY * i, width: squareWidth, height: squareHeight)
//    let squareView = UIView(frame: squareFrame)
//    c += 1
//    squareView.backgroundColor = colors[c]
//    canvas.addSubview(squareView)
//    }
//}

//Auto Layout Implementation
let squareWidth = canvas.frame.width/3
let squareHeight = canvas.frame.height/3
var c = -1
for i in 0..<3 {
    for z in 0..<3 {
        let squareView = UIView()
        c += 1
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.backgroundColor = colors[c]
        canvas.addSubview(squareView)
        NSLayoutConstraint(item: squareView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 1/3, constant: 0).isActive = true
        NSLayoutConstraint(item: squareView, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: 1/3, constant: 0).isActive = true
        NSLayoutConstraint(item: squareView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: squareWidth * CGFloat(z)).isActive = true
        NSLayoutConstraint(item: squareView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: squareHeight * CGFloat(i)).isActive = true
    }
}