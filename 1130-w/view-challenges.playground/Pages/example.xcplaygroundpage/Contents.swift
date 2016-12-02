import UIKit
import PlaygroundSupport

let canvasFrame = CGRect(x: 0, y :0, width: 400, height: 200)
let canvas = UIView(frame: canvasFrame)
canvas.backgroundColor = .white
PlaygroundPage.current.liveView = canvas // make the canvas appear in the assistant editor

/*:
 **Task**: Add two `UIView`s to the `canvas`. The positioning and size of the two views have the following requirements:
 
 - the **blue** view should have a _margin_ of 20 points each to the _leading_ (left), _top_ and to the _bottom_ edge; its `width` should further be half the `width` of the `canvas`
 - the **green** view has no _margin_ to the _trailing_ (right) edge; it should further be square and its `width` should be half the `width` of the **blue** view; on the y-axis it should have the same _center_ as **blue**
 
 
 ![Example](./example.png "Example")
 
 1. Implement above task by setting the views' `frame`s directly.
 2. Implement above task by defining _AutoLayout_ constraints programmatically.
 
 (Make sure to comment out the first implementation once you start working on the second one to avoid confusion.)
 */
/*:
 #### 1st implementation
 */
// configure blue
let margin = 20
let blueX = margin
let blueY = margin
let blueWidth = canvas.frame.size.width * 0.5
let blueHeight = Int(canvas.frame.size.height) - margin - margin
let blueFrame = CGRect(x: blueX, y: blueY, width: Int(blueWidth), height: blueHeight)

let blueView = UIView(frame: blueFrame)
blueView.backgroundColor = .blue
canvas.addSubview(blueView)

// configure green
let greenWidth = blueView.frame.size.width * 0.5
let greenHeight = greenWidth
let greenX = canvas.frame.size.width - greenWidth

let greenFrame = CGRect(x: Int(greenX), y: 0, width: Int(greenWidth), height: Int(greenHeight))
let greenView = UIView(frame: greenFrame)
greenView.backgroundColor = .green
canvas.addSubview(greenView)

greenView.center.y = blueView.center.y
/*:
#### 2nd implementation
*/
// configure blue
//let blueView = UIView(frame: CGRect.zero)
//blueView.translatesAutoresizingMaskIntoConstraints = false
//blueView.backgroundColor = .blue
//canvas.addSubview(blueView)
//
//let margin: CGFloat = 20
//NSLayoutConstraint(item: blueView, attribute: .height, relatedBy: .equal, toItem: canvas, attribute: .height, multiplier: 1, constant: (-margin-margin)).isActive = true
//NSLayoutConstraint(item: blueView, attribute: .width, relatedBy: .equal, toItem: canvas, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
//NSLayoutConstraint(item: blueView, attribute: .leading, relatedBy: .equal, toItem: canvas, attribute: .leading, multiplier: 1, constant: margin).isActive = true
//NSLayoutConstraint(item: blueView, attribute: .top, relatedBy: .equal, toItem: canvas, attribute: .top, multiplier: 1, constant: margin).isActive = true
//NSLayoutConstraint(item: blueView, attribute: .bottom, relatedBy: .equal, toItem: canvas, attribute: .bottom, multiplier: 1, constant: margin).isActive = true
//
//// configure green
//let greenView = UIView(frame: CGRect.zero)
//greenView.translatesAutoresizingMaskIntoConstraints = false
//greenView.backgroundColor = .green
//canvas.addSubview(greenView)
//
//NSLayoutConstraint(item: greenView, attribute: .trailing, relatedBy: .equal, toItem: canvas, attribute: .trailing, multiplier: 1, constant: 0).isActive = true
//NSLayoutConstraint(item: greenView, attribute: .width, relatedBy: .equal, toItem: blueView, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
//NSLayoutConstraint(item: greenView, attribute: .height, relatedBy: .equal, toItem: blueView, attribute: .width, multiplier: 0.5, constant: 0).isActive = true
//NSLayoutConstraint(item: greenView, attribute: .centerY, relatedBy: .equal, toItem: blueView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true


