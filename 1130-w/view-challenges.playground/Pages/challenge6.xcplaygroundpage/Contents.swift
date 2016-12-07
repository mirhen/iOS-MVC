import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 400, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor


/*:
 **Task**: Add two `UIView`s to the `canvas`. The positioning and size of the two views have the following requirements:
 
 - the **blue** view should have a _margin_ of 20 points each to the _top_ and to the _leading_ (left) edge; it should further be square and have half the `height` as the `canvas`
 - the **green** view should have a _margin_ of 20 points each to the _bottom_ and to the _trailing_ (right) edge; it should further be square and have half the `height` as the `canvas`
 
 ![Challenge 6](./challenge6.png "Challenge 6")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
let margin: CGFloat = 20
//let width = Int(canvas.frame.height)/2
//let height = width
//
//let blueX = margin
//let blueY = margin
//let bluewView = UIView(frame: CGRect(x: blueX, y: blueY, width: width, height: height))
//bluewView.backgroundColor = .blue
//canvas.addSubview(bluewView)
//
//let greenX = Int(canvas.frame.width) - width - margin
//let greenY = Int(canvas.frame.height) - height - margin
//let greenView = UIView(frame: CGRect(x: greenX, y: greenY, width: width, height: height))
//greenView.backgroundColor = .green
//canvas.addSubview(greenView)

//Auto Layout Implementation
let blueView = UIView()
blueView.translatesAutoresizingMaskIntoConstraints = false
blueView.backgroundColor = .blue
canvas.addSubview(blueView)

NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: blueView, attribute: .height, multiplier: 1, constant: 0).isActive = true
NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: margin).isActive = true
NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: margin).isActive = true

let greenView = UIView()
greenView.translatesAutoresizingMaskIntoConstraints = false
greenView.backgroundColor = .green
canvas.addSubview(greenView)

NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: blueView, attribute: .height, multiplier: 1, constant: 0).isActive = true
NSLayoutConstraint(item: greenView, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 1, constant: -margin).isActive = true
NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: canvas, attribute: .trailing, multiplier: 1, constant: -margin).isActive = true
