import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 100)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

let colors: [UIColor] = [.green, .blue, .red]

/*:
 **Task**: Add three `UIView`s to the `canvas`. Each of these views should be square and have the canvas's full `height` as well as a third of its `width`. Use the same colors as in the picture (they are already defined for you above in the `colors` array):

 ![Challenge 3](./challenge3.png "Challenge 3")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
//let squareWidth = Int(canvas.frame.width) / 3
//let squareHeight = Int(canvas.frame.height)
//let squareY = 0
//var squareX = squareWidth
//
//for color in 0..<colors.count {
//    var squareFrame = CGRect(x: squareX * color, y: squareY, width: squareWidth, height: squareHeight)
//    var squareView = UIView(frame: squareFrame)
//    squareView.backgroundColor = colors[color]
//    canvas.addSubview(squareView)
//}

//Auto Layout Implemaentation

let squareWidth = canvas.frame.width/3

for i in 0..<colors.count {
    let squareView = UIView()
    squareView.translatesAutoresizingMaskIntoConstraints = false
    squareView.backgroundColor = colors[i]
    canvas.addSubview(squareView)
    
    NSLayoutConstraint(item: squareView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 1/3, constant: 0).isActive = true
    NSLayoutConstraint(item: squareView, attribute: .height, relatedBy: .equal, toItem: squareView, attribute: .width, multiplier: 1, constant: 0).isActive = true
    NSLayoutConstraint(item: squareView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: squareWidth*CGFloat(i)).isActive = true

}