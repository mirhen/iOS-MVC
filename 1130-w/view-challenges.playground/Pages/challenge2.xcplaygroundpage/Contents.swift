
import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 300, height: 300)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

///*:
// **Task**: Add three `UIView`s to the `canvas`. Each of these views should be square and have a third of the `canvas`' `width` and `height`. 
// 
// 
// ![Challenge 2](./challenge2.png "Challenge 2")
// 
// 1. Implement above task by setting the views' `frame`s directly.
// 2. Implement above task by defining _AutoLayout_ constraints programmatically.
// 
// (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
// */
//let redWidth = Int(canvas.frame.width) / 3
//let redHeight = redWidth
//for i in 0...3 {
//    var redFrame = CGRect(x: redWidth * i, y: redHeight * i, width: redWidth, height: redHeight)
//    var redView = UIView(frame: redFrame)
//    redView.backgroundColor = .red
//    canvas.addSubview(redView)
//}

//Auto Layout

let redWidth = canvas.frame.width/3
let redHeight = canvas.frame.height/3

for i in 0..<3 {
    let redView = UIView()
    redView.backgroundColor = .red
    redView.translatesAutoresizingMaskIntoConstraints = false
    canvas.addSubview(redView)
NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 1/3, constant: 0).isActive = true
NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: redView, attribute: .width, multiplier: 1, constant: 0).isActive = true
NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1/3, constant: redWidth * CGFloat(i)).isActive = true
NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: redHeight * CGFloat(i)).isActive = true
    
}
