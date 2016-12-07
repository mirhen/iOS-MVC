import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 400, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor


/*:
 **Task**: Add two `UIView`s to the `canvas`. The positioning and size of the two views have the following requirements:
 
 - the **blue** view should have a _margin_ of 20 points each to the _top_ and to the _bottom_ edge; it has no margin on the _leading_ (left) edge; its `width` should further be one fourth of the `width` of the `canvas`
 - the **green** view has no _margin_ to the _trailing_ (right) edge; its `width` should further be half the `width` of the `canvas` and its `height` should be half the `height` of the **blue** view (not the `canvas`); on the y-axis it should have the same _center_ as **blue**
 
 ![Challenge 5](./challenge5.png "Challenge 5")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
//let blueMargin = 20
//let blueWidth = Int(canvas.frame.width)/4
//let blueHeight = Int(canvas.frame.height) - blueMargin - blueMargin
//let blueView = UIView(frame: CGRect(x: 0, y: 0, width: blueWidth, height: blueHeight))
//blueView.center.y = canvas.center.y
//blueView.backgroundColor = .blue
//canvas.addSubview(blueView)
//
//let greenWidth = Int(canvas.frame.width)/2
//let greenHeight = Int(blueView.frame.height)/2
//let greenX = Int(canvas.frame.width) - greenWidth
//let greenView = UIView(frame: CGRect(x: greenX, y: 0, width: greenWidth, height: greenHeight))
//greenView.center.y = blueView.center.y
//greenView.backgroundColor = .green
//canvas.addSubview(greenView)

// Auto Layout Implementation
let margin: CGFloat = 20
let blueView = UIView()
blueView.translatesAutoresizingMaskIntoConstraints = false
blueView.backgroundColor = .blue
canvas.addSubview(blueView)

NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 1/4, constant: 0).isActive = true
NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: margin).isActive = true
NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 1, constant: -margin).isActive = true

let greenView = UIView()
greenView.translatesAutoresizingMaskIntoConstraints = false
greenView.backgroundColor = .green
canvas.addSubview(greenView)

NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: canvas, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: blueView, attribute: .height, multiplier: 0.5, constant: 0).isActive = true
NSLayoutConstraint(item: greenView, attribute: .centerY, relatedBy: .equal, toItem: canvas, attribute: .centerY, multiplier: 1, constant: 0).isActive = true

